package com.ecjtu.service.impl;

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
	public List<Department> selectAll() {
		return this.departmentDao.selectAll();
	}
}