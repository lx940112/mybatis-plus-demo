/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.xlkh.demo.user;

import com.xlkh.demo.bo.ResourceBO;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 登录用户信息
 *
 * @author Mark sunlightcs@gmail.com
 * @since 1.0.0
 */
@Data
public class UserDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String username;
    private String realName;
    private String headUrl;
    private Integer gender;
    private String email;
    private String mobile;
    private Long deptId;
    private String password;
    private Integer status;
    private Integer superAdmin;
    /**
     * 是否被管理员踢出   0：正常   1：被踢出，无权调用接口
     */
    private int kill;
    /**
     * 部门数据权限
     */
    private List<Long> deptIdList;
    /**
     * 用户资源列表
     */
    private List<ResourceBO> resourceList;

}