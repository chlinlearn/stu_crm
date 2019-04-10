package com.ecjtu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Staff;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface StaffDao extends Mapper<Staff>{
	@Select("select id,staffCode,loginName,loginPwd,"
			+ " staffName,gender,email,birthday,onDutyDate,"
			+ " postID,state from crm_staff where postID=${postID}")
	List<Staff> selectStaffByPostID(@Param("postID") int postID);
}
