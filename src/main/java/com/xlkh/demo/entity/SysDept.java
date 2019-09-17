package com.xlkh.demo.entity;

import lombok.Data;

import java.time.LocalDateTime;

import java.io.Serializable;

/**
 * @author Lucas
 */
@Data
public class SysDept  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/** id */ 
	private Long id;
	/** 上级ID */ 
	private Long pid; 
	/** 所有上级ID，用逗号分开 */ 
	private String pids; 
	/** 部门名称 */ 
	private String deptName; 
	/** 描述 */ 
	private String description; 
	/** 排序 */ 
	private Integer sort; 
	/** 删除标识:1-未删除; 0-删除 */ 
	private Integer delFlag;
	/** 创建人 */ 
	private Long createUser; 
	/** 创建时间 */ 
	private LocalDateTime createTime;
	/** 更新人 */ 
	private Long updateUser; 
	/** 更新时间 */ 
	private LocalDateTime updateTime;


}
