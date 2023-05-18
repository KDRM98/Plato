package com.study.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("/test");
		return "Dongmin/test";
	}
	@RequestMapping("/reply")
	public String reply() {
		System.out.println("/reply");
		return "Dongmin/reply";
	}
	@RequestMapping("/recipe")
	public String recipe() {
		System.out.println("/recipe");
		return "Dongmin/recipe";
	}
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("/main");
		return "Yuchan/mainpage";
	}
	
	

	
	

}
