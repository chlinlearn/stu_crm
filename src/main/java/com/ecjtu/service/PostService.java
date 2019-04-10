package com.ecjtu.service;

import java.util.List;

import com.ecjtu.po.Department;
import com.ecjtu.po.Post;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.common.Mapper;

public interface PostService extends IBaseService<Post>{
	PageBean<Post> search(Integer page, Integer rows, String... param);
	
	List<Post> getByDepId(int id);
	
	PageBean<Post> getPagingList(Integer page, Integer rows, String... param);

}
