package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.StaffDao;
import com.ecjtu.po.Staff;
import com.ecjtu.service.StaffService;

@Service
@Transactional
public class StaffServiceImpl implements StaffService{
	@Autowired
	private StaffDao staffDao;

	@Override
	public List<Staff> selectAll() {
		// TODO Auto-generated method stub
		return this.staffDao.selectAll();
	}

	@Override
	public Staff selectOne(Staff record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Staff> select(Staff record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Staff selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Staff record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Staff> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Staff selectOneByExample(Object example) {
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
	public int updateByExample(Staff record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExampleSelective(Staff record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Staff> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Staff> selectByRowBounds(Staff record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
