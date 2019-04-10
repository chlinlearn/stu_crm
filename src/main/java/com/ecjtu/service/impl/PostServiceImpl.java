package com.ecjtu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.PostDao;
import com.ecjtu.dao.ReferDao;
import com.ecjtu.dao.StaffDao;
import com.ecjtu.po.Department;
import com.ecjtu.po.Post;
import com.ecjtu.po.Refer;
import com.ecjtu.po.Staff;
import com.ecjtu.service.PostService;
import com.ecjtu.util.PageBean;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private StaffDao staffDao;

	@Override
	public int add(Post post) {
		if (validPostName(post) != 1) {
			return 0;
		}
		return this.postDao.insert(post);
	}

	private int validPostName(Post post) {
		if (null == post.getPostName() && post.getPostName().equals("")) {
			return 0;
		}
		if (post.getPostName().contains("where") || post.getPostName().contains("from")
				|| post.getPostName().contains("order by")) {
			return 0;
		}
		/* 判断该职务是否已经存在 */
		Example example = new Example(Post.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("postName", post.getPostName());
		criteria.andEqualTo("depID", post.getDepID());
		List<Post> posts = postDao.selectByExample(example);
		if (posts.size() >= 1) {
			return 0;
		}
		return 1;
	}

	@Override
	public int del(Object id) {
		int postID = 0;
		try {
			postID = Integer.parseInt(id.toString());
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		List<Staff> staffs = staffDao.selectStaffByPostID(postID);
		if (staffs.size() >= 1) {
			return 0;
		}
		Example example = new Example(Post.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("id", postID);
		Post post = new Post();
		post.setIsCancel(1);
		return postDao.updateByExampleSelective(post, example);
	};

	@Override
	public List<Post> getAll() {
		// TODO Auto-generated method stub
		return this.postDao.getAll();
	}

	@Override
	public int update(Post post) {
		if (validPostName(post) != 1) {
			return 0;
		}
		return postDao.updateByPrimaryKeySelective(post);
	}

	@Override
	public Post getById(int id) {
		return this.postDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Post> getByDepId(int id) {
		Example example = new Example(Post.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("depID", id);
		return this.postDao.selectByExample(example);
	}

	/**
	 * 分页实现
	 */
	public PageBean<Post> getPagingList(Integer page, Integer rows, String... param) {
		Post post = new Post();
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param && param.length >= 1) {
			post.setPostName(param[0]);
			map.put("postName", post.getPostName());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Post> customers = postDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Post.class);
		Criteria ct = example.createCriteria();
		ct.andLike("postName", "%" + post.getPostName() + "%");
		Integer count = postDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Post> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	@Override
	public PageBean<Post> search(Integer page, Integer rows, String... param) {
		Post post = new Post();
		System.out.println(param[0] + "," + param[1]);
		Map<String, String> map = new HashMap<>();
		// 当前页
		map.put("start", ((page - 1) * rows) + "");
		// 每页数
		map.put("rows", rows + "");
		if (null != param && param.length >= 1) {
			post.setPostName(param[0]);
			post.setDepID(Integer.parseInt(param[1]));
			map.put("postName", post.getPostName());
			map.put("depID", post.getDepID().toString());
		}
		// 查询客户列表(自定义 sql 语句)
		List<Post> customers = postDao.selectPagingList(map);
		// 查询客户列表总记录数(通过条件查询生成动态 sql 语句)
		Example example = new Example(Post.class);
		Criteria ct = example.createCriteria();
		ct.andEqualTo("postName", post.getPostName());
		ct.andEqualTo("depID", post.getDepID());
		Integer count = postDao.selectCountByExample(example);
		// 创建 Page 返回对象
		PageBean<Post> result = new PageBean<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
