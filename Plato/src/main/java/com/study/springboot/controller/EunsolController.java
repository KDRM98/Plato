package com.study.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	//----------------------------체킹
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
	
	@RequestMapping("/jf")
	public String jf() {
		System.out.println("/jf");
		return "Eunsol/joinForm";
	}
	
	@RequestMapping("/login_check")
	public String login_check(
			HttpServletRequest request,
			Model model,
			@ModelAttribute memberDTO DTO
			) {
		System.out.println("/login_check");

		String nextPage = "Eunsol/header";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int loginCheck = member.loginCheck(DTO);
		memberDTO basicInfo = member.basicInfo(DTO);
		String nickname = basicInfo.getNickname();
		int uerid = basicInfo.getUser_id();			
		
		HttpSession session = request.getSession();
		if (id != null && pw != null) {
			if (loginCheck == 1) {
				// 로그인 확인 완료s

				// 세션 가져오기
				

				// 세션 저장하기
				session.setAttribute("loginSession", id);
				model.addAttribute("nickname", nickname);
				nextPage = "Eunsol/header";

			} else {
				// 회원정보 없음
				
				session.setAttribute("msg", "아이디나 비밀번호가 올바르지 않습니다.");
				nextPage = "/loginForm";
			}
		} else {
			
			session.setAttribute("msg", "아이디와 비밀번호를 입력해주세요.");
			nextPage = "/login?msg";
		}

		return nextPage;
	}
	
	@RequestMapping("/profile2")
	public String profile2() {
		System.out.println("/profile2");
		return "Eunsol/profile2";
	}
	
	//----------------- 구현
	//회원가입 페이지
	@RequestMapping("/joinForm")
	public String joinForm(
			@ModelAttribute memberDTO DTO, Model model
			) {
		System.out.println("/joinForm");

		return "viewList1";
	}
	
	//id 중복검사
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
	
	//nickname 중복검사
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
	
	// 가입하기 버튼 누르면 연결
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String join(
			@ModelAttribute memberDTO memberDTO, Model model,
			HttpServletRequest req
			)
	{
		System.out.println("/join");
		// 빈 칸 체크
	    if (memberDTO.getId().isEmpty() || idCheck(memberDTO.getId(), memberDTO) != -1 ||memberDTO.getPw().isEmpty() || memberDTO.getPw_ck().isEmpty()
	    		|| memberDTO.getNickname().isEmpty() || memberDTO.getEmail().isEmpty()|| memberDTO.getGender().isEmpty()
	    		|| memberDTO.getAge()== -1) 
	    
	    {
	    	 if(memberDTO.getId().isEmpty()) {
		    	 model.addAttribute("errorId", "아이디를 입력해주세요."); 
		    }
	    	 
	    	 if(idCheck(memberDTO.getId(), memberDTO) != -1) {
	    		 System.out.println("join 아이디 중복확인");
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
		    
		    if( memberDTO.getGender()== "-1") {
		    	 model.addAttribute("errorGender", "성별을 선택해주세요."); 
		    }
		    
		    if( memberDTO.getAge()== -1) {
		    	 model.addAttribute("errorAge", "연령대를 선택해주세요."); 
		    }
		    
	        return "viewList1"; // 에러가 발생한 JSP 페이지로 이동
	    }
  
	   
	    
	    
		//데이터베이스에 삽입
		int result = member.insertMember(memberDTO);
		System.out.println("insertMember 결과" + result);
		
		//회원가입완료 페이지에 닉네임 뜨게
		String nickname = req.getParameter("nickname");
		model.addAttribute("nickname", nickname);
		
		return "viewList3";
	}
	
	
	//회원가입 완료 페이지
	@RequestMapping("/joincomp")
	public String joincomp() {

		return "Eunsol/joincomp";
	}
	
	
	//마이페이지 중 프로필수정
	@RequestMapping("/profile")
	public String profile() {
		System.out.println("/profile");
		return "viewList2";
	}
	


	
	
}
