package com.ecjtu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecjtu.po.CrmClass;
import com.ecjtu.service.CrmClassService;

import lombok.val;

@Controller
@RequestMapping("/crmclass")
public class CrmClassController {

	@Autowired
	private CrmClassService crmClassService;

	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<CrmClass> crmClasses = crmClassService.getAll();
		model.addAttribute("crmClasses", crmClasses);
		return "crmclass";
	}

	@RequestMapping(value = "/search.action")
	public String search(@RequestParam("classname") String classname, @RequestParam("state") String state,
			Model model) {
		CrmClass crmClass = new CrmClass();
		crmClass.setState(state);
		crmClass.setClassname(classname);
//		crmClass.setBegintime(begintime);
		System.out.println(classname + "/" + state);
		List<CrmClass> crmClasses = this.crmClassService.search(crmClass);
		model.addAttribute("crmClasses", crmClasses);
		return "crmclass";
	}
	
	@PostMapping("/create.action")
	public void create(CrmClass crmClass) {
		
		crmClassService.add(crmClass);
	}
}
