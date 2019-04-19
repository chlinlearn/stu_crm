package com.ecjtu.service.impl;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ecjtu.dao.DepartmentDao;
import com.ecjtu.dao.PostDao;
import com.ecjtu.po.Department;
import com.ecjtu.po.Post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ecjtu.service.DepartmentService;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PostDao postDao;
	// 选择全部数据

	@Override
	public int add(Department dep) {

		if (validDepName(dep) != 1) {
			return 0;
		}
		return this.departmentDao.insert(dep);
	}

	private int validDepName(Department dep) {
		/*
		 * 判断是否是空字符串或者非法字符 [\u4e00-\u9fa5]待完成
		 */
		Pattern pattern = Pattern.compile("[!@#$%&~^]");
		Matcher matcher = pattern.matcher(dep.getDepName());
		
		if (null == dep.getDepName() && dep.getDepName().equals("")
			&& matcher.find() ){
			return 0;
		}
		// 判断是否有sql脚本注入
		if (dep.getDepName().contains("where") || dep.getDepName().contains("from")
				|| dep.getDepName().contains("order by")) {
			return 0;
		}
		/* 判断新添加的部门是否存在 */
		Example example = new Example(Department.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("depName", dep.getDepName());
		List<Department> list = departmentDao.selectByExample(example);
		if (list.size() >= 1) {
			return 0;
		}
		return 1;
	}

	@Override
	public int del(Object id) {
		int depID = 0;
		try {
			depID = Integer.parseInt(id.toString());
		} catch (NumberFormatException e) {
			return 0;
		}

		List<Post> posts = postDao.selectPostBydepId(depID);
		if (posts.size() >= 1) {
			return 0;
		}

		Example example = new Example(Department.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("id", depID);
		Department department = new Department();
		department.setIsCancel(1);
		return this.departmentDao.updateByExampleSelective(department, example);
	}

	@Override
	public List<Department> getAll() {
		Example example = new Example(Department.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("isCancel", 0);
		return this.departmentDao.selectByExample(example);
	}

	@Override
	public int update(Department dep) {
		// TODO Auto-generated method stub
		if (validDepName(dep) != 1) {
			return 0;
		}
		return this.departmentDao.updateByPrimaryKeySelective(dep);
	}

	@Override
	public Department getById(int id) {
		// TODO Auto-generated method stub
		return this.departmentDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Department> selectBydepname(Department department) {
		// TODO Auto-generated method stub
		return this.departmentDao.select(department);
	}

	/**
	 * 分页实现
	 */
	public PageBean<Department> getPagingList(Integer page, Integer rows, String... param) {
		Department dep = new Department();
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param&&param.length >= 1) {
			dep.setDepName(param[0]);
			map.put("depName", dep.getDepName());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Department> customers = departmentDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Department.class);
		Criteria ct = example.createCriteria();
		ct.andLike("depName", "%" + dep.getDepName() + "%");
		Integer count = departmentDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Department> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}