package com.study.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	int likeCount=33;
	boolean isLiked = true;
	String id = "admin";
	String pw = "1234";
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
	public String recipe(
			HttpServletRequest request,
			Model model
			) {
		System.out.println("/recipe");
	    model.addAttribute("likeCount", likeCount);
	    model.addAttribute("isLiked", isLiked);
		return "Dongmin/recipe";
	}
	
	@RequestMapping("/recipeLike")
	public String updateRecipe(
	        @RequestParam(value = "likeCount") int likeCount,
	        @RequestParam(value = "isLiked") boolean isLiked,
	        HttpServletRequest request,
	        Model model) {
	    
		this.isLiked = isLiked;
	    this.likeCount = likeCount;
	    System.out.println(isLiked);
	    System.out.println(this.isLiked);
	    System.out.println(this.likeCount);
	    // 처리 로직...
	    
	    // 업데이트된 값들을 응답으로 전달
	    
	    return "Dongmin/recipe";
	}
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("/main");
		return "Yuchan/mainpage";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("/mypage");
		return "Hyunyoung/Mypage";
	}

}