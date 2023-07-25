package com.study.springboot.controller;

import java.util.HashMap;
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
public class postController2 {

	@Autowired
	private postService2 service;

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
		model.addAttribute("likeTotalCount", service.likeTotalCount(dto2));
		System.out.println("total :"+ total);
		
		String nickname = (String)session.getAttribute("nickname");
		String image = (String)session.getAttribute("image");
		//한번에 하는 방법이 있나

		model.addAttribute("nickname" ,nickname);
		model.addAttribute("image" ,image);
		
		return "viewList8";
	}
	
	
	@RequestMapping("/likepost")
	@ResponseBody
	public Map likepost(HttpServletRequest req, @ModelAttribute postDTO2 dto2, Model model,
			@RequestParam(value = "pageNum", required = false) Integer pageNum) {
		
		System.out.println("/likepost 들어왔다");
		
		if (pageNum == null) {
			pageNum = 1;
		}
		System.out.println("pageNum : " + pageNum);


		int countPerpage = 10;
		int startNum = ((pageNum - 1) * countPerpage) + 1;
		int endNum = startNum + (countPerpage - 1);

		dto2.setStartNum(startNum);
		dto2.setEndNum(endNum);

		
		HttpSession session = req.getSession();
		dto2.setUserid((int)session.getAttribute("userid"));
		Map map = service.likePost(dto2);
		
		List likePost = (List) map.get("likePost");		
		map.put("likePost", likePost);
		map.put("countPerpage", countPerpage);
		map.put("pageNum", pageNum);
		
	
		
		int total = (int) map.get("likeTotalCount");
		map.put("total", total);
		System.out.println("total :"+ total);
		
		
		double lastPage = Math.ceil((double) total / countPerpage);

	    // 페이징 그룹
		// 한 그룹당 보여줄 수
		int groupCount =3;
		// 현재 페이지
		// 현재 속한 그룹
		double group = Math.floor((((double)pageNum-1)/ groupCount) + 1);
		// 그룹의 시작 페이지, 끝 페이지
		int end = (int) group*groupCount;
		if(end > lastPage){
			end= (int)lastPage;
		}
		int begin = end - (groupCount-1);
		if(begin < 1){
			begin = 1;
			end = groupCount;
		} 
		map.put("begin", begin);
		map.put("end", end);
		map.put("lastPage", lastPage);
		System.out.println("lastPage:"+ lastPage);
		System.out.println("조회수 :" + likePost.get(0));
		return map;
	}
	
	@RequestMapping("/mypage2")
	public String gesipan2(
			HttpServletRequest req, 
			@ModelAttribute postDTO2 dto2, 
			Model model,
			@RequestParam(value = "chk") List chk) {
		
		System.out.println("/mypage2 들어왔다");
		System.out.println("chk : " + chk);
		service.chk(chk);
		return "redirect:/mypage";
		
	}
	
	@RequestMapping("/likesdel")
	@ResponseBody
	public Map likesdel(
			HttpServletRequest req, 
			@ModelAttribute postDTO2 dto2, 
			Model model,
			@RequestParam(value = "chk") List chk) {
		
		System.out.println("/likesdel 들어왔다");
		System.out.println("chk : " +chk);
		int result = service.likesdel(chk);
		System.out.println("좋아요취소 개수 :" + result);
		Map map = new HashMap();
		map.put("com", "완료");
		
		HttpSession session = req.getSession();
		dto2.setUserid((int)session.getAttribute("userid"));
		int likeTotalCount = service.likeTotalCount(dto2);
		map.put("likeTotalCount", likeTotalCount);
		System.out.println("likeTotalCount : " + likeTotalCount);
		return map;
		
	}
	
}