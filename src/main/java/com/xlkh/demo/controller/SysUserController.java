package com.xlkh.demo.controller;

import com.xlkh.demo.dao.SysDeptDao;
import com.xlkh.demo.dto.SysUserDTO;
import com.xlkh.demo.entity.SysDept;
import com.xlkh.demo.service.SysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Lucas
 */
@RestController
public class SysUserController {

    @Autowired
    private SysDeptDao sysDeptDao;
    @Autowired
    private SysUserService sysUserService;

    @GetMapping("/test1")
    @RequiresPermissions({"123"})
    public Map<String, Object> test1(){
        Map<String, Object> map = new HashMap<>(3);
        SysUserDTO sysUserDTO = sysUserService.get(1171268378076758018L);
        map.put("getById", sysUserDTO);
        SysUserDTO zhangyf = sysUserService.getByUsername("zhangyf");
        map.put("getByUsername", zhangyf);
        int countByDeptId = sysUserService.getCountByDeptId(1169178694051815425L);
        map.put("getCountByDeptId", countByDeptId);
        return map;
    }


    @GetMapping("/test2")
    @RequiresPermissions({"321"})
    public Map<String, Object> test2(){
        Map<String, Object> map = new HashMap<>(3);
        LocalDateTime curDate = sysDeptDao.getCurDate();
        SysDept sysDept1 = sysDeptDao.selectById(1L);
        SysDept sysDept2 = sysDeptDao.selectByDeptId(1L);
        map.put("currentDate",curDate );
        map.put("sysDept1",sysDept1 );
        map.put("sysDept2",sysDept2 );
        return map;
    }


}
