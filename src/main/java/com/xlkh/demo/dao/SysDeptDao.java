package com.xlkh.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xlkh.demo.entity.SysDept;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDateTime;

/**
 * 
 * @author Lucas
 *
 */
@Mapper
public interface SysDeptDao extends BaseMapper<SysDept> {

    /**
     *  查当前时间
     * @return LocalDateTime
     */
    LocalDateTime getCurDate();


    /**
     *  根据ID查
     * @return LocalDateTime
     * @param id id
     */
    SysDept selectByDeptId(long id);

}
