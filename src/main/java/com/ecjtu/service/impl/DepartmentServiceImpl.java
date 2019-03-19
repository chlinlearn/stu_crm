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
	public List<Department> selectAll() {
		return this.departmentDao.selectAll();
	}
	@Override
	public Department selectOne(Department record) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Department> select(Department record) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int selectCount(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Department selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int insert(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertSelective(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateByPrimaryKey(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateByPrimaryKeySelective(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(Department record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Department> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Department selectOneByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int selectCountByExample(Object example) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteByExample(Object example) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateByExample(Department record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateByExampleSelective(Department record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Department> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Department> selectByRowBounds(Department record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
}