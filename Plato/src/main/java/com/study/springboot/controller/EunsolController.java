package com.study.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.study.springboot.dto.memberDTO;
import com.study.springboot.service.memberService;

/*import jakarta.servlet.http.HttpServletRequest;*/

@Controller
public class EunsolController {

	@Autowired
	memberService member;
	
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
	
	@RequestMapping("/joinForm")
	public String joinForm(
			@ModelAttribute memberDTO DTO, Model model
			) {
		System.out.println("/joinForm");
		int result = member.idCheck(DTO);
		if (result == -1) {
			model.addAttribute("msg", "이미 사용중인 아이디 입니다.");
		}
		return "viewList1";
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String join(
			@ModelAttribute memberDTO memberDTO, Model model
			)
	{
		int result = member.insertMember(memberDTO);
		System.out.println("insertMember 결과" + result);
		
	
		
		
		return "viewList1";
	}
	
	
	@RequestMapping("/profile")
	public String profile() {
		System.out.println("/profile");
		return "viewList2";
	}
	
	@RequestMapping("/profile2")
	public String profile2() {
		System.out.println("/profile2");
		return "Eunsol/profile2";
	}

	
	
}
