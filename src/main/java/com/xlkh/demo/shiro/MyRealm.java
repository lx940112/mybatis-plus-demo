package com.xlkh.demo.shiro;

import com.google.common.collect.Sets;
import com.xlkh.demo.dto.SysUserDTO;
import com.xlkh.demo.jwt.JwtToken;
import com.xlkh.demo.jwt.JwtUtil;
import com.xlkh.demo.redis.RedisUtils;
import com.xlkh.demo.service.SysUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Set;

/**
 * @author Lucas
 */
@Component
public class MyRealm extends AuthorizingRealm {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private RedisUtils redisUtils;

    /**
     * 必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    /**
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SysUserDTO user = (SysUserDTO)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        String key = "";
        long expire = 0L;
        Set<Object> strSet = redisUtils.getStrSet(key);
        Set<String> permissions;
        if (CollectionUtils.isEmpty(strSet)) {
            permissions = getPermissionCodesByUserId(user.getId());
            redisUtils.sSet(key, permissions);
        } else {
            permissions = objSet2StrSet(strSet);
        }
        redisUtils.expire(key,expire);
        simpleAuthorizationInfo.addStringPermissions(permissions);
        return simpleAuthorizationInfo;
    }

    private Set<String> objSet2StrSet(Set<Object> strSet) {
        if (!CollectionUtils.isEmpty(strSet)) {
            Set<String> result = Sets.newConcurrentHashSet();
            strSet.forEach(x->result.add(x.toString()));
            return result;
        }
        return null;
    }

    private Set<String> getPermissionCodesByUserId(Long id) {
        Set<String> result = Sets.newConcurrentHashSet();
        result.add("123");
        return result;
    }



    /**
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getCredentials();
        // 解密获得username，用于和数据库进行对比
        String username = JwtUtil.getUsername(token);
        if (username == null) {
            throw new AuthenticationException("token无效");
        }

        SysUserDTO userBean = sysUserService.getByUsername(username);

        if (userBean == null) {
            throw new AuthenticationException("用户不存在!");
        }

        if (!JwtUtil.verify(token, username, userBean.getPassword())) {
            throw new AuthenticationException("用户名或密码错误");
        }
        return new SimpleAuthenticationInfo(userBean, token, this.getName());
    }


}
