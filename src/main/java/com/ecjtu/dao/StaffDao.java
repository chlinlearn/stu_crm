package com.ecjtu.dao;

import org.springframework.stereotype.Repository;

import com.ecjtu.po.Staff;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface StaffDao extends Mapper<Staff>{

}
