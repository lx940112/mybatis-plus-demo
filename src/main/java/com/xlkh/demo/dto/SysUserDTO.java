package com.xlkh.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 用户管理
 * @author Lucas
 */
@Data
public class SysUserDTO implements Serializable {
    private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String password;
	private String realName;
	private String headUrl;
	private Integer gender;
	private String email;
	private String mobile;
	private Long deptId;
	private Integer superAdmin;
	private Integer status;
	private String remark;
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private LocalDateTime createDate;
	private List<Long> roleIdList;
	private String deptName;

}