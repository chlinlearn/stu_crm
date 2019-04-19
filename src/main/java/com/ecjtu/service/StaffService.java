package com.ecjtu.service;

import com.ecjtu.po.Post;
import com.ecjtu.po.Staff;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.common.Mapper;

public interface StaffService extends IBaseService<Staff>{

	PageBean<Staff> search(Integer page, Integer rows, String... param);
	
	PageBean<Staff> getPagingList(Integer page, Integer rows, String... param);
}
