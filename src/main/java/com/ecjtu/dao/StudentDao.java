package com.ecjtu.dao;

import org.springframework.stereotype.Repository;

import com.ecjtu.po.Student;

import tk.mybatis.mapper.common.Mapper;

@Repository
public interface StudentDao extends Mapper<Student>{

}
