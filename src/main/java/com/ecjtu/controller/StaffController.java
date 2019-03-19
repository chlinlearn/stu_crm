package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Staff;
import com.ecjtu.service.StaffService;

@Controller
@RequestMapping("/staff")
public class StaffController {
	@Autowired
	private StaffService staffService;
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Staff> staffs = staffService.selectAll();
		model.addAttribute("staffs", staffs);
		return "/staff";
	}
}
