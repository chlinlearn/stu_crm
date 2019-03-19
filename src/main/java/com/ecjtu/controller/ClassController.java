package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Class;
import com.ecjtu.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassController {

	@Autowired
	private ClassService classService;
	
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Class> classes = classService.selectAll();
		model.addAttribute("classes", classes);
		return "class";
	}
}
