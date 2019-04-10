package com.ecjtu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Department;
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
	List<Post> selectPostBydepId(@Param(value="depID") int depID);

	//换行字符串前加空格
	@Select("select p.id,p.postName,p.depID,p.isCancel,d.depName as depName from crm_post p,crm_department d"
			+ " where p.depID = d.id and p.isCancel = 0 and postName like '%${postName}%' "
			+ " limit ${start},${rows} ")
	List<Post> selectPagingList(Map<String, String> map);	

	//搜索
	@Select("select p.id,p.postName,p.depID,p.isCancel,d.depName as depName from crm_post p,crm_department d"
			+ " where d.id=p.depID and postName=${postName} and depID=${depID} "
			+ " limit ${start},${rows} ")
	List<Post> selectPagingListBySearch(Map<String, String> map);

}
