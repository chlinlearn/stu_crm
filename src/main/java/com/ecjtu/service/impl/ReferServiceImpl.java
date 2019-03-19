package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.ReferDao;
import com.ecjtu.po.Refer;
import com.ecjtu.service.ReferService;

@Service
@Transactional
public class ReferServiceImpl implements ReferService{
	@Autowired
	private ReferDao referDao;
	
	public List<Refer> selectAll(){
		return this.referDao.selectAll();
	}

	@Override
	public Refer selectOne(Refer record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Refer> select(Refer record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Refer selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Refer record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Refer> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Refer selectOneByExample(Object example) {
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
	public int updateByExample(Refer record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExampleSelective(Refer record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Refer> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Refer> selectByRowBounds(Refer record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

}
