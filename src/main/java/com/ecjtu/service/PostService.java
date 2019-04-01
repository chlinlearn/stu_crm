package com.ecjtu.service;

import java.util.List;

import com.ecjtu.po.Post;

import tk.mybatis.mapper.common.Mapper;

public interface PostService extends IBaseService<Post>{
	List<Post> search(Post post);
	
	List<Post> getByDepId(int id);

}
