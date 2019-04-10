package com.ecjtu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecjtu.po.Department;
import com.ecjtu.po.Refer;
import com.ecjtu.service.ReferService;
import com.ecjtu.util.PageBean;

@Controller
@RequestMapping("/refer")
public class ReferController {
	@Autowired
	private ReferService referService;
	
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Refer> refers = referService.getAll();
		model.addAttribute("refers", refers);
		return "refer";
	}

	@RequestMapping("/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, 
			@RequestParam(defaultValue = "5") Integer rows,
			@RequestParam(defaultValue = "") String username, Model model) {
		// 条件查询分页后的部门集合
		PageBean<Refer> refers = referService.getPagingList(page, rows, username);
		System.out.println(refers);
		model.addAttribute("page", refers);
		return "refer";
	}
}
