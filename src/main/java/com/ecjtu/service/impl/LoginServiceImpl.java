package com.ecjtu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.LoginDao;
import com.ecjtu.po.Staff;
import com.ecjtu.service.LoginService;
import com.ecjtu.util.MD5Util;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;

	@Override
	public List<Staff> login(String loginName,String loginPwd) {
		// TODO Auto-generated method stub
		String loginpwd = MD5Util.getMD5Value(loginPwd);
		
		Example example = new Example(Staff.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("loginName",loginName);
		criteria.andEqualTo("loginPwd",loginPwd);
		return loginDao.selectByExample(example);
	}
	
}
