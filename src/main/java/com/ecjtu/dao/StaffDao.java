package com.ecjtu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Post;
import com.ecjtu.po.Staff;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface StaffDao extends Mapper<Staff>{
	@Select("select id,staffCode,loginName,loginPwd,"
			+ " staffName,gender,email,birthday,onDutyDate,"
			+ " postID,state from crm_staff where postID=${postID}")
	List<Staff> selectStaffByPostID(@Param("postID") int postID);

	//换行字符串前加空格
	@Select("select s.id,s.staffCode,s.loginName,s.loginPwd," + 
			" s.staffName,s.gender,s.email,s.birthday,s.onDutyDate," + 
			" s.postID,s.state,p.postName as postName from crm_post p,crm_staff s"
			+ " where s.postID = p.id and s.isDelete = 0 and staffName like '%${staffName}%' "
			+ " limit ${start},${rows} ")
	List<Staff> selectPagingList(Map<String, String> map);	
	
	//搜索
	@Select("select s.id,s.staffCode,s.loginName,s.loginPwd," + 
			" s.staffName,s.gender,s.email,s.birthday,s.onDutyDate," + 
			" s.postID,s.state,p.postName as postName from crm_post p,crm_staff s where p.id=s.postID and staffName=${staffName} and postID=${postID} "
			+ " limit ${start},${rows} ")
	List<Post> selectPagingListBySearch(Map<String, String> map);


}
