package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ecjtu.dao.CrmClassDao;
import com.ecjtu.po.CrmClass;
import com.ecjtu.service.CrmClassService;

@Service
@Transactional
public class CrmClassServiceImpl implements CrmClassService{
	@Autowired
	private CrmClassDao crmClassDao;

	@Override
	public int add(CrmClass t) {
		// TODO Auto-generated method stub
		return this.crmClassDao.insert(t);
	}

	@Override
	public int del(Object id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CrmClass> getAll() {
		// TODO Auto-generated method stub
		return this.crmClassDao.selectAll();
	}

	@Override
	public int update(CrmClass t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CrmClass getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrmClass> search(CrmClass crmClass) {
		// TODO Auto-generated method stub
		return this.crmClassDao.select(crmClass);
	}

}
