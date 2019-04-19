package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecjtu.po.Department;
import com.ecjtu.po.Post;
import com.ecjtu.service.PostService;
import com.ecjtu.util.JsonResult;
import com.ecjtu.util.PageBean;
import com.ecjtu.util.ResultStatus;

/*职务管理*/

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostService postService;

	/*
	 * @RequestMapping("/findAll.action") public String findAll(Model model) {
	 * List<Post> posts = postService.getAll(); model.addAttribute("posts", posts);
	 * return "post"; }
	 */

	@RequestMapping("/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
			@RequestParam(defaultValue = "") String postName, Model model) {
		// 条件查询分页后的部门集合
		PageBean<Post> posts = postService.getPagingList(page, rows, postName);
		System.out.println(posts);
		model.addAttribute("page", posts);
		return "post";
	}

	@RequestMapping("/search.action")
	public String search(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
			@RequestParam("postName") String postName, @RequestParam("depID") String depID, Model model) {
		PageBean<Post> posts = postService.search(page, rows, postName, depID);
		System.out.println(posts);
		model.addAttribute("page", posts);
		return "post";
	}

	@RequestMapping("/create.action")
	@ResponseBody
	public String create(Post post) {
		post.setIsCancel(0);
		int num = postService.add(post);
		return num == 1 ? "OK" : "ERROR";
	}

	@RequestMapping("/update.action")
	@ResponseBody  
	public String update(Post post) {
		int num = postService.update(post);
		return num == 1 ? "OK" : "ERROR";
	}

	@RequestMapping("/delete.action")
	@ResponseBody
	public String delete(int id) {
		int num = postService.del(id);
		if(num > 0) {
			return "OK";
		}else {
			return "ERROR";
		}		
	}
	
	@RequestMapping("/getPostById.action")
	@ResponseBody
	public Post getPostById(int id) {		
		return postService.getById(id);
	}
}
