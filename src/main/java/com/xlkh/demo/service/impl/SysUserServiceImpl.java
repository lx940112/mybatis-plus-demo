package com.xlkh.demo.service.impl;

import com.xlkh.demo.dao.SysUserDao;
import com.xlkh.demo.dto.SysUserDTO;
import com.xlkh.demo.entity.SysUserEntity;
import com.xlkh.demo.service.SysUserService;
import com.xlkh.demo.utils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户管理
 * @author Lucas
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public SysUserDTO get(Long id) {
        SysUserEntity entity = sysUserDao.getById(id);

        return ConvertUtils.sourceToTarget(entity, SysUserDTO.class);
    }

    @Override
    public SysUserDTO getByUsername(String username) {
        SysUserEntity entity = sysUserDao.getByUsername(username);
        return ConvertUtils.sourceToTarget(entity, SysUserDTO.class);
    }

    @Override
    public int getCountByDeptId(Long deptId) {
        return sysUserDao.getCountByDeptId(deptId);
    }
}