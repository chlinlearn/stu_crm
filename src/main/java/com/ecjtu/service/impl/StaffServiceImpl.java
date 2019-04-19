package com.ecjtu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.StaffDao;
import com.ecjtu.po.Post;
import com.ecjtu.po.Staff;
import com.ecjtu.service.StaffService;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class StaffServiceImpl implements StaffService{
	@Autowired
	private StaffDao staffDao;

	@Override
	public int add(Staff t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int del(Object id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Staff> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Staff t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Staff getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 分页实现
	 */
	public PageBean<Staff> getPagingList(Integer page, Integer rows, String... param) {
		Staff staff = new Staff();
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param && param.length >= 1) {
			staff.setStaffName(param[0]);
			map.put("staffName", staff.getStaffName());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Staff> customers = staffDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Staff.class);
		Criteria ct = example.createCriteria();
		ct.andLike("staffName", "%" + staff.getStaffName() + "%");
		Integer count = staffDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Staff> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;  
	}
	
	@Override
	public PageBean<Staff> search(Integer page, Integer rows, String... param) {
		Staff staff = new Staff();
		System.out.println(param[0] + "," + param[1]);
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param && param.length >= 1) {
			staff.setStaffName(param[0]);
			staff.setPostID(Integer.parseInt(param[1]));
			map.put("staffName", staff.getStaffName());
			map.put("postID", staff.getPostID().toString());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Staff> customers = staffDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Staff.class);
		Criteria ct = example.createCriteria();
		ct.andEqualTo("staffName", staff.getStaffName());
		ct.andEqualTo("postID", staff.getPostID());
		Integer count = staffDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Staff> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
}
