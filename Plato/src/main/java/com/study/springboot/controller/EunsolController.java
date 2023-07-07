package com.study.springboot.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		return "viewList1";
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(
			@RequestParam("id") String id,
			@ModelAttribute memberDTO DTO
			) {
		System.out.println("/idcheck");
		int result = member.idCheck(DTO);
		System.out.println("idCheck_result: " +result);
		return result;
	}
	
	@RequestMapping("/nickCheck")
	@ResponseBody
	public int nickCheck(
			HttpServletRequest req,
			@ModelAttribute memberDTO DTO
			) {
		System.out.println("/nickCheck");
		
		
		  String nick = req.getParameter("nickname"); 
		  int result = member.nicknameCheck(DTO); 
		  System.out.println("nickCheck_result: " +result);
		 		
		return result;
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String join(
			@ModelAttribute memberDTO memberDTO, Model model,
			HttpServletRequest req
			)
	{
		System.out.println("/join");
		// 빈 칸 체크
	    if (memberDTO.getId().isEmpty() || memberDTO.getPw().isEmpty() || memberDTO.getPw_ck().isEmpty()
	    		|| memberDTO.getNickname().isEmpty() || memberDTO.getEmail().isEmpty()|| memberDTO.getGender().isEmpty()
	    		|| memberDTO.getAge()== -1) 
	    
	    {
	    	 if(memberDTO.getId().isEmpty()) {
		    	 model.addAttribute("errorId", "아이디를 입력해주세요."); 
		    }
	    	 
	    	 if(idCheck(memberDTO.getId(), memberDTO) != -1) {
		    	 model.addAttribute("duId", "이미 사용중인 아이디 입니다."); 
		    }
	    	 
		    
		    if(memberDTO.getPw().isEmpty()) {
		    	 model.addAttribute("errorPw", "비밀번호를 입력해주세요."); 
		    }
		    
		    if(memberDTO.getPw_ck().isEmpty()) {
		    	 model.addAttribute("errorPw_ck", "비밀번호 재확인을 입력해주세요."); 
		    }
		    
		    if( memberDTO.getNickname().isEmpty()) {
		    	 model.addAttribute("errorNickname", "이메일을 입력해주세요."); 
		    }
		    
		    if( memberDTO.getEmail().isEmpty()) {
		    	 model.addAttribute("errorEmail", "별명을 입력해주세요."); 
		    }
		    
		    if( memberDTO.getGender().isEmpty()) {
		    	 model.addAttribute("errorGender", "성별을 선택해주세요."); 
		    }
		    
		    if( memberDTO.getAge()== -1) {
		    	 model.addAttribute("errorAge", "연령대를 선택해주세요."); 
		    }
		    
	        return "viewList1"; // 에러가 발생한 JSP 페이지로 이동
	    }
  
		
		int result = member.insertMember(memberDTO);
		System.out.println("insertMember 결과" + result);
		String nickname = req.getParameter("nickname");
		model.addAttribute("nickname", nickname);
		return "viewList3";
	}
	
	@RequestMapping("/joincomp")
	public String joincomp(
			@ModelAttribute memberDTO DTO, Model model
			) {

		return "Eunsol/joincomp";
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
