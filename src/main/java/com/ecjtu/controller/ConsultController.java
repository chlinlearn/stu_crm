package com.ecjtu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/consult")
public class ConsultController {
	
	@RequestMapping("/findAll.action")
	public String findAll() {
		return "consult";
	}
}
