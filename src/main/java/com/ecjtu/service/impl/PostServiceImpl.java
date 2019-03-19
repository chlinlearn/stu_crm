package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.PostDao;
import com.ecjtu.po.Post;
import com.ecjtu.service.PostService;

@Service
@Transactional
public class PostServiceImpl implements PostService{
	@Autowired
	private PostDao postDao;
	
	@Override
	public List<Post> selectAll() {
		// TODO Auto-generated method stub
		return this.postDao.selectAll();
	}

	@Override
	public Post selectOne(Post record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> select(Post record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post selectOneByExample(Object example) {
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
	public int updateByExample(Post record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExampleSelective(Post record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> selectByRowBounds(Post record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
