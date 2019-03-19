package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Department;
import com.ecjtu.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Department> departments = departmentService.selectAll();
		model.addAttribute("departments", departments);
		return "department";
	}

}
