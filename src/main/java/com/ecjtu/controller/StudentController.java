package com.ecjtu.controller;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Student;
import com.ecjtu.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Student> students = studentService.selectAll();
		model.addAttribute("students", students);
		return "student";
	}
}
