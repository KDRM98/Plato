package com.study.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/header")
	public String header() {
		System.out.println("/header");
		return "Eunsol/header";
	}
	
	@RequestMapping("/footer")
	public String footer() {
		System.out.println("/footer");
		return "Eunsol/footer";
	}
	
	@RequestMapping("/login_check")
	public String login_check(
			HttpServletRequest request,
			Model model
			) {
		System.out.println("/login_check");

		String nextPage = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String _id = "admin";
		String _pw = "1234";
		
		if( id != null && pw != null) {
			
		}else {
			model.addAttribute("error", "아이디와 패스워드는 필수 입니다.");
			nextPage = "Eunsol/header";
		}
		
		
		
		
		return "Eunsol/header";
	}
	
	@RequestMapping("/join")
	public String join() {
		System.out.println("/join");
		return "Eunsol/join";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		System.out.println("/profile");
		return "Eunsol/profile";
	}
	
	@RequestMapping("/profile2")
	public String profile2() {
		System.out.println("/profile2");
		return "Eunsol/profile2";
	}

	
	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("/mypage");
		return "Hyunyoung/Mypage";
	}

}