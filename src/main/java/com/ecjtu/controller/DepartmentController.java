package com.ecjtu.controller;

import java.lang.ProcessBuilder.Redirect;
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
import com.ecjtu.po.Post;
import com.ecjtu.service.DepartmentService;
import com.ecjtu.service.PostService;
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
	public String search(@RequestParam("depName") String depName, Model model) {
		Department department = new Department();
		department.setDepName(depName);
		List<Department> departments = departmentService.selectBydepname(department);
		System.out.println(departments);
		model.addAttribute("departments", departments);
		return "department";
	}

	/*
	 * 添加部门,
	 * 不允许添加已有的部门名字,
	 * 非法字符串不允许添加,
	 * 不能提交空字符串
	 */
	@RequestMapping(value = "/create.action", method = RequestMethod.POST)
	@ResponseBody
	public String create(Department dep) {
		System.out.println(dep.getDepName());
		int num = departmentService.add(dep);
		// 返回状态码,信息,数据
		return num==1?"OK":"ERROR";
	}

	/* 通过id获取修改的部门信息 */
	@RequestMapping("/getDepartmentById.action")
	@ResponseBody
	public Department getDepartmentById(@RequestParam("id") Integer id) {
		Department department = new Department();
		department.setId(id);
		Department departments = departmentService.getById(id);
		return departments;
	}

	/* 更新部门信息 */
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	@ResponseBody
	public String update(Department dep) {
		System.out.println(dep.getId() + "," + dep.getDepName());
		int num = departmentService.update(dep);
		return num==1?"OK":"ERROR";
	}

	/*
	 * 根据部门id删除,
	 * 如果该部门下有职员(post表depID),
	 * 则不能删除(不能修改状态)
	 */
	@RequestMapping("/delete.action")
	@ResponseBody
	public String delete(Department dep) {
		System.out.println("id = " + dep.getId());	
		int num = departmentService.del(dep.getId());
		return num==1?"OK":"ERROR";
	}
	
}