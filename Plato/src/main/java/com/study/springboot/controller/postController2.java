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

import com.study.springboot.dto.postDTO2;
import com.study.springboot.service.postService2;

@Controller
public class postController2 {

	@Autowired
	private postService2 service;

	/*
	 * @RequestMapping("/rough") public String rough(@ModelAttribute postDTO2 dto2,
	 * Model model) { System.out.println("/rough 들어왔다");
	 * 
	 * dto2.setUserid(52); // userid 52번으로 지정
	 * 
	 * int result = service.rough(dto2); model.addAttribute("result", result);
	 * 
	 * System.out.println(result); return "Hyunyoung/rough"; }
	 */

	@RequestMapping("/mypage")
	public String gesipan(HttpServletRequest req, @ModelAttribute postDTO2 dto2, Model model,
			@RequestParam(value = "pageNum", required = false) Integer pageNum) {
		System.out.println("/gesipan 들어왔다");
		HttpSession session = req.getSession();
		/* dto2.setUserid((int) req.getAttribute("userid")); */

		if (pageNum == null) {
			pageNum = 1;
		}
		System.out.println("pageNum : " + pageNum);

		/* String cpp = req.getParameter("countPerpage"); */
		int countPerpage = 10;

		/*
		 * try { countPerpage = Integer.parseInt(cpp); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */

		int startNum = ((pageNum - 1) * countPerpage) + 1;
		int endNum = startNum + (countPerpage - 1);

		dto2.setStartNum(startNum);
		dto2.setEndNum(endNum);

		req.setAttribute("pageNum", pageNum);
		model.addAttribute("countPerpage", countPerpage);
		
		dto2.setUserid((int)session.getAttribute("userid"));
		Map map = service.gesipan(dto2);
		
		List gsp = (List) map.get("gsp");		
		model.addAttribute("gsp", gsp);

		int total = (int) map.get("totalCount");
		req.setAttribute("total", total);
		System.out.println("total :"+ total);
		
		String nickname = (String)session.getAttribute("nickname");
		String image = (String)session.getAttribute("image");
		//한번에 하는 방법이 있나

		model.addAttribute("nickname" ,nickname);
		model.addAttribute("image" ,image);
		
		return "viewList8";
	} 

}