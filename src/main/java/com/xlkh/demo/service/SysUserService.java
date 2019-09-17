package com.xlkh.demo.service;

import com.xlkh.demo.dto.SysUserDTO;

/**
 * 用户管理
 * @author Lucas
 */
public interface SysUserService{

    /**
     * 根据用户ID,查询用户信息
     * @param id 用户ID
     * @return 用户信息
     */

    SysUserDTO get(Long id);

    /**
     * 根据用户名,查询用户信息
     * @param username  用户名
     * @return  用户信息
     */
    SysUserDTO getByUsername(String username);

    /**
     * 根据部门ID，查询用户数
     * @param deptId 部门ID
     * @return  用户数
     */
    int getCountByDeptId(Long deptId);
}