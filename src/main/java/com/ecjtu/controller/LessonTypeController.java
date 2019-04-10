package com.ecjtu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lessontype")
public class LessonTypeController {

	@RequestMapping("/findAll.action")
	public String findAll() {
		return "lessontype";
	}
}
