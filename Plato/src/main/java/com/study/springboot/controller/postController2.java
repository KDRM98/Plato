package com.study.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.postDTO2;
import com.study.springboot.service.postService2;

@Controller
public class postController2 {
	
	@Autowired
	postService2 service2;
	
	@RequestMapping("/rough")
	public String rough(@ModelAttribute postDTO2 dto2, Model model) {
		System.out.println("/rough 들어왔다");
		
		dto2.setUserid(52);  // userid 52번으로 지정
		
		int result = service2.rough(dto2);
		model.addAttribute("result", result);
		
		System.out.println(result);
		return "Hyunyoung/rough";
	}
	


}