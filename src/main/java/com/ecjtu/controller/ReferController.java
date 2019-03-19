package com.ecjtu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ecjtu.po.Refer;
import com.ecjtu.service.ReferService;

@Controller
@RequestMapping("/refer")
public class ReferController {
	@Autowired
	private ReferService referService;
	
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Refer> refers = referService.selectAll();
		model.addAttribute("refers", refers);
		return "refer";
	}

}
