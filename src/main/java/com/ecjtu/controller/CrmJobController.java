package com.ecjtu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Refer;

@Controller
@RequestMapping("/crmjob")
public class CrmJobController {

	@RequestMapping("/findAll.action")
	public String findAll() {
		return "crmjob";
	}
}
