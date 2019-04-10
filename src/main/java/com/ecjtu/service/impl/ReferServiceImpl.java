package com.ecjtu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.ReferDao;
import com.ecjtu.po.Department;
import com.ecjtu.po.Refer;
import com.ecjtu.service.ReferService;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class ReferServiceImpl implements ReferService{
	@Autowired
	private ReferDao referDao;

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
	public Refer getById(int id) {
		// TODO Auto-generated method stub
		return referDao.selectByPrimaryKey(id);
	}

	/**
	 * 分页实现
	 */
	public PageBean<Refer> getPagingList(Integer page, Integer rows, String... param) {
		Refer refer = new Refer();
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param&&param.length >= 1) {
			refer.setUsername(param[0]);
			map.put("username", refer.getUsername());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Refer> customers = referDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Refer.class);
		Criteria ct = example.createCriteria();
		ct.andLike("username", "%" + refer.getUsername() + "%");
		Integer count = referDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Refer> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
