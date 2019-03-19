package com.ecjtu.dao;

import org.springframework.stereotype.Repository;

import com.ecjtu.po.Post;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface PostDao extends Mapper<Post>{

}
