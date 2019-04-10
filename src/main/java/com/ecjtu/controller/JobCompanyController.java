package com.ecjtu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jobcompany")
public class JobCompanyController {

	@RequestMapping("/findAll.action")
	public String findAll() {
		return "jobcompany";
	}
}
