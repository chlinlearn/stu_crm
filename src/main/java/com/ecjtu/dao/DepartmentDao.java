package com.ecjtu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Department;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface DepartmentDao extends Mapper<Department>{
	@Select("select id,depName from crm_department "
			+ "where depName like '%${depName}% "
			+ "limit ${start},${rows}'")
	List<Department> selectPagingList(Map<String, String> map);	

}
