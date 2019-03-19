package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ecjtu.dao.ClassDao;
import com.ecjtu.po.Class;
import com.ecjtu.service.ClassService;

@Service
@Transactional
public class ClassServiceImpl implements ClassService{
	@Autowired
	private ClassDao classDao;
	
	public List<Class> selectAll(){
		return this.classDao.selectAll();
	}

	@Override
	public Class selectOne(Class record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Class> select(Class record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Class selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Class record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Class> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Class selectOneByExample(Object example) {
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
	public int updateByExample(Class record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExampleSelective(Class record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Class> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Class> selectByRowBounds(Class record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

}
