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
	public int add(Post t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int del(Object id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> getAll() {
		// TODO Auto-generated method stub
		return this.postDao.getAll();
	}

	@Override
	public int update(Post t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> search(Post post) {
		// TODO Auto-generated method stub
		return this.postDao.select(post);
	}
	
}
