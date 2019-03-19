package com.ecjtu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@RequestMapping("/findAll.action")
	public String findAll() {
		return "department";
	}

}
