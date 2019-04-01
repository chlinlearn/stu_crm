package com.ecjtu.service;

import java.util.List;

import com.ecjtu.po.Department;
import com.ecjtu.po.Refer;

//通用接口
public interface IBaseService<T> {

	public int add(T t);
	
	public int del(Object id);
	
	public List<T> getAll();
	
	public int update(T t);
	
	public T getById(int id);

	
}
