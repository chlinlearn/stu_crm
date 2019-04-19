package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecjtu.po.Department;
import com.ecjtu.po.Post;
import com.ecjtu.po.Staff;
import com.ecjtu.service.StaffService;
import com.ecjtu.util.PageBean;

@Controller
@RequestMapping("/staff")
public class StaffController {
	@Autowired
	private StaffService staffService;
	
	/*
	 * @RequestMapping("/findAll.action") public String findAll(Model model) {
	 * List<Staff> staffs = staffService.selectAll(); model.addAttribute("staffs",
	 * staffs); return "/staff"; }
	 */
	

	@RequestMapping("/search.action")
	public String search(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
			@RequestParam("staffName") String staffName, @RequestParam("depID") String depID, Model model) {
		PageBean<Staff> staffs = staffService.search(page, rows, staffName, depID);
		System.out.println(staffs);
		model.addAttribute("page", staffs);
		return "staff";
	}


	@RequestMapping(value = "/create.action", method = RequestMethod.POST)
	@ResponseBody
	public String create(Staff staff) {
		// 返回状态码,信息,数据
		int num =0;
		return num == 1 ? "OK" : "ERROR";
	}

	/* 通过id获取修改的信息 */
	@RequestMapping("/getStaffById.action")
	@ResponseBody
	public Staff getStaffById(@RequestParam("id") Integer id) {
		Staff staff = new Staff();
		staff.setId(id);
		Staff staffs = staffService.getById(id);
		return staffs;
	}

	/* 更新信息 */
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	@ResponseBody
	public String update(Staff staff) {
		int num = staffService.update(staff);
		return num == 1 ? "OK" : "ERROR";
	}

	@RequestMapping("/delete.action")
	@ResponseBody
	public String delete(int id) {
		System.out.println("id = " + id);
		int num = staffService.del(id);
		if(num > 0) {
			return "OK";
		}else {
			return "ERROR";
		}	
	}

	@RequestMapping("/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, 
			@RequestParam(defaultValue = "5") Integer rows,
			@RequestParam(defaultValue = "") String staffName, Model model) {
		// 条件查询分页后的集合
		PageBean<Staff> staffs = staffService.getPagingList(page, rows, staffName);
		System.out.println(staffs);
		model.addAttribute("page", staffs);
		return "staff";
	}
}
