package com.ecjtu.service;

import java.util.List;

import com.ecjtu.po.Staff;

public interface LoginService{
	List<Staff> login(String loginName,String loginPwd);
}
