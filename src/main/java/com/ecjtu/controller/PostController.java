package com.ecjtu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecjtu.po.Post;
import com.ecjtu.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostService postService;

	@RequestMapping("/findAll.action")
	public String findAll(Model model) {
		List<Post> posts = postService.getAll();
		model.addAttribute("posts", posts);
		return "post";
	}
	
	@RequestMapping("/search.action")
	public String search() {
		return "post";
	}
}
