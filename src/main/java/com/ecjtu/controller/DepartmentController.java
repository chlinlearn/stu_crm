package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecjtu.po.Department;
import com.ecjtu.service.DepartmentService;
import com.ecjtu.util.JsonResult;
import com.ecjtu.util.ResultStatus;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;

	/* 查找所有信息 */
	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Department> departments = departmentService.getAll();
		model.addAttribute("departments", departments);
		return "department";
	}

	/* 搜索部门 */
	@RequestMapping("/search.action")
	public String search(@RequestParam("depname") String depname, Model model) {
		Department department = new Department();
		department.setDepName(depname);
		List<Department> departments = departmentService.selectBydepname(department);
		System.out.println(departments);
		model.addAttribute("departments", departments);
		return "department";
	}

	/* 添加部门 */
	@RequestMapping(value = "/create.action", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<Department> create(@RequestParam("depname") String depname) {
		System.out.println(depname);
		Department department = new Department();
		department.setDepName(depname);
		departmentService.add(department);
		//返回状态码,信息,数据
		return JsonResult.success("OK", department);
	}
	
	/* 更新部门信息 */
	@RequestMapping(value="/update.action",method = RequestMethod.POST)
	public void update(@RequestParam("depname") String depname) {
		Department department = new Department();
		System.out.println(depname);
		department.setDepName(depname);
		department.getId();
		System.out.println(department.getId());
		departmentService.update(department);
	}
	
	/* 根据部门id删除 */
	public void delete() {
		
	}

}
