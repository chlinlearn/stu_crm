package com.ecjtu.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ecjtu.po.Department;

import tk.mybatis.mapper.common.Mapper;

public interface DepartmentService extends IBaseService<Department>{

	/* 实现搜索功能 */
	List<Department> selectBydepname(Department department);

}