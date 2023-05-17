package com.study.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("/test");
		return "test";
	}
	@RequestMapping("/reply")
	public String reply() {
		System.out.println("/reply");
		return "reply";
	}
	@RequestMapping("/recipe")
	public String recipe() {
		System.out.println("/recipe");
		return "recipe";
	}
	@RequestMapping("/NewFile")
	public String NewFile() {
		System.out.println("/NewFile");
		return "NewFile";
	}
	
	
}
