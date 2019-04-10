package com.ecjtu.service;

import com.ecjtu.po.Department;
import com.ecjtu.po.Refer;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.common.Mapper;

public interface ReferService extends IBaseService<Refer>{
	PageBean<Refer> getPagingList(Integer page, Integer rows, String... param);
}
