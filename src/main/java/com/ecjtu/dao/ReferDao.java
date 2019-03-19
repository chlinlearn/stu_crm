package com.ecjtu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ecjtu.po.Refer;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface ReferDao extends Mapper<Refer>{
	
	@Select("select" + 
			"	r.id,r.source,r.userid,r.username,r.gender,r.email,r.idcard,r.phone," + 
			"r.weixin,r.qq,r.shopgood,r.state,r.isJob,r.byAcademy,r.resourceLevel,r.remark,s.staffName as referName" + 
			"	from crm_refer r,crm_staff s" + 
			"	where r.userid = s.staffCode")
	public List<Refer> getAll();

}
