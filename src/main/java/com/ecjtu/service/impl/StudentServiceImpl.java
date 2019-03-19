package com.ecjtu.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecjtu.dao.StudentDao;
import com.ecjtu.po.Student;
import com.ecjtu.service.StudentService;

@Service
@Transactional
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentDao studentDao;

	@Override
	public List<Student> selectAll() {
		// TODO Auto-generated method stub
		return this.studentDao.selectAll();
	}

	@Override
	public Student selectOne(Student record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student> select(Student record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Student selectByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsWithPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insert(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Student record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Student> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student selectOneByExample(Object example) {
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
	public int updateByExample(Student record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExampleSelective(Student record, Object example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Student> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student> selectByRowBounds(Student record, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
