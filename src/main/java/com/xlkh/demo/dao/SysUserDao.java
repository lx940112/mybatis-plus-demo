/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.xlkh.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xlkh.demo.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户管理
 * @author Lucas
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {

    /**
     *  根据参数，查询用户信息列表
     * @param params    参数
     * @return  用户信息列表
     */
    List<SysUserEntity> getList(Map<String, Object> params);

    /**
     * 根据用户ID,查询用户信息
     * @param id 用户ID
     * @return 用户信息
     */
    SysUserEntity getById(Long id);

    /**
     * 根据用户名,查询用户信息
     * @param username  用户名
     * @return  用户信息
     */
    SysUserEntity getByUsername(String username);

    /**
     * 根据用户ID，修改密码
     * @param id    用户ID
     * @param newPassword 新密码
     * @return  成功的行数
     */
    int updatePassword(@Param("id") Long id, @Param("newPassword") String newPassword);

    /**
     * 根据部门ID，查询用户数
     * @param deptId 部门ID
     * @return  用户数
     */
    int getCountByDeptId(Long deptId);

}