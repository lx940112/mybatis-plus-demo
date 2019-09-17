/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : 10.1.3.28:3306
Source Database       : cloud_demo1

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-09-16 18:31:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `pids` varchar(500) DEFAULT NULL COMMENT '所有上级ID，用逗号分开',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) unsigned DEFAULT NULL COMMENT '删除标识:1-未删除; 0-删除',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`),
  KEY `idx_del_flag` (`del_flag`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统_部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `del_flag` tinyint(4) unsigned DEFAULT NULL COMMENT '删除标识:1-未删除; 0-删除',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_dept_id` (`dept_id`),
  KEY `idx_del_flag` (`del_flag`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统_角色管理';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID',
  `username` varchar(60) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(60) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(4) unsigned DEFAULT NULL COMMENT '性别: 0-女; 1-男; 2-保密',
  `icon_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `super_admin` tinyint(4) unsigned DEFAULT NULL COMMENT '超级管理员: 1-是; 0-不是',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) unsigned DEFAULT NULL COMMENT '删除标识:1-未删除; 0-删除',
  `password_reset_time` datetime DEFAULT NULL COMMENT '末次密码更新时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  KEY `idx_del_flag` (`del_flag`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统_用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
