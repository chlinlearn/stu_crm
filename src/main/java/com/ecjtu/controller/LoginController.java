package com.ecjtu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecjtu.po.Staff;
import com.ecjtu.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(@RequestParam("loginName") String loginName,@RequestParam("loginPwd") String loginPwd, Model model, HttpSession session) {
		System.out.println(loginName+':'+loginPwd);
		List<Staff> user = loginService.login(loginName,loginPwd);
		System.out.println(user);
		if (user.size() != 0) {
			// 将用户对象添加到 Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
			return "redirect:department/findAll.action";// 跳转到部门列表页面
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		// 返回到登录页面
		return "login";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除 Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.action";
	}

	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
}
