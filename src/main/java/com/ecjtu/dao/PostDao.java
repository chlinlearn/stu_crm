package com.ecjtu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Post;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface PostDao extends Mapper<Post>{
	
	@Select("select p.id,p.postName,p.depID,d.depName as depName" + 
			"  from crm_post p,crm_department d" + 
			"  where p.depID = d.id")
	public List<Post> getAll();
	
	@Select("select id,postName,depID from "
			+ "crm_post where depID = ${depID}")
	List<Post> selectPostBydepId(int depID);
}
