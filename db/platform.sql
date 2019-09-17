/*
Navicat MySQL Data Transfer

Source Server         : 10.1.3.102
Source Server Version : 50173
Source Host           : 10.1.3.102:3306
Source Database       : platform

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-09-17 21:42:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log_visit
-- ----------------------------
DROP TABLE IF EXISTS `log_visit`;
CREATE TABLE `log_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP',
  `function_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '功能代码',
  `content` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '操作内容',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1387 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志_访问日志';

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `function_code` varchar(100) DEFAULT NULL COMMENT '功能代码',
  `function_name` varchar(100) DEFAULT NULL COMMENT '功能名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级功能ID',
  `function_desc` varchar(200) DEFAULT NULL COMMENT '功能描述',
  `function_url` varchar(1024) DEFAULT NULL COMMENT '功能URL',
  `function_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `function_remark` varchar(256) DEFAULT NULL COMMENT '功能备注',
  `function_type` int(11) DEFAULT NULL COMMENT '功能类型',
  `sort` int(11) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL COMMENT '打开链接',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='系统_功能';

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `group_name` varchar(30) DEFAULT NULL COMMENT '用户组名',
  `group_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `group_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统_用户组';

-- ----------------------------
-- Table structure for sys_group_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_user`;
CREATE TABLE `sys_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `group_id` int(11) DEFAULT NULL COMMENT '用户组ID',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='系统_用户组_用户';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `role_remark` varchar(200) DEFAULT NULL COMMENT '角色备注',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统_角色';

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `function_id` int(11) DEFAULT NULL COMMENT '功能ID',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2851 DEFAULT CHARSET=utf8 COMMENT='系统_角色_功能';

-- ----------------------------
-- Table structure for sys_role_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_group`;
CREATE TABLE `sys_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `group_id` int(11) DEFAULT NULL COMMENT '用户组ID',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统_角色_用户组';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(32) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `user_status` varchar(20) DEFAULT NULL COMMENT '状态',
  `user_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `user_telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `user_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `password_reset_time` datetime DEFAULT NULL COMMENT '末次密码更新时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统_用户';
