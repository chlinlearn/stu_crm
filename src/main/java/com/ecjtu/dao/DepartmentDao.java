package com.ecjtu.dao;

import org.springframework.stereotype.Repository;

import com.ecjtu.po.Department;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface DepartmentDao extends Mapper<Department>{

}