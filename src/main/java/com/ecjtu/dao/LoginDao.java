package com.ecjtu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Staff;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface LoginDao extends Mapper<Staff> {
	
}
