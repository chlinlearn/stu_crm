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
	public int add(Refer t) {
		// TODO Auto-generated method stub
		return this.referDao.insert(t);
	}

	@Override
	public int del(Object id) {
		// TODO Auto-generated method stub
		return referDao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Refer> getAll() {
		// TODO Auto-generated method stub
		return this.referDao.getAll();
	}

	@Override
	public int update(Refer t) {
		// TODO Auto-generated method stub
		return referDao.updateByPrimaryKey(t);
	}

	@Override
	public Refer getById(String id) {
		// TODO Auto-generated method stub
		return referDao.selectByPrimaryKey(id);
	}

}
