package com.ecjtu.service.impl;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ecjtu.dao.DepartmentDao;
import com.ecjtu.po.Department;
import java.util.List;
import com.ecjtu.service.DepartmentService;


@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentDao departmentDao;
	//选择全部数据

	@Override
	public int add(Department t) {
		// TODO Auto-generated method stub
		return this.departmentDao.insert(t);
	}

	@Override
	public int del(Object id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Department> getAll() {
		// TODO Auto-generated method stub
		return this.departmentDao.selectAll();
	}

	@Override
	public int update(Department t) {
		// TODO Auto-generated method stub
		return this.departmentDao.updateByPrimaryKeySelective(t);
	}

	@Override
	public Department getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Department> selectBydepname(Department department) {
		// TODO Auto-generated method stub
		return this.departmentDao.select(department);
	}

}