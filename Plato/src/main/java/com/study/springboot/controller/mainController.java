package com.study.springboot.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.postDTO2;
import com.study.springboot.service.postService2;

@Controller
public class mainController {

	@Autowired
	private postService2 service;

	@RequestMapping("/main")
	public String main(@ModelAttribute postDTO2 dto2, Model model) {
		
		System.out.println("/main 들어왔다");
		
		dto2.setStartNum(1);
		dto2.setEndNum(3);

		List<postDTO2> mainViews = service.mainViews(dto2);
		
		model.addAttribute("mainViews", mainViews);

		String mnp = mainViews.get(0).getMnp(); 
		System.out.println(mnp);
		return "viewList9";
	}
	
}