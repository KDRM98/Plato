package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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

	// ----------------------------체킹
	@RequestMapping("/header")
	public String header(HttpServletRequest request, Model model) {
		System.out.println("/header");

		HttpSession session = request.getSession();
		if (session.getAttribute("userid") != null) { // 세션 값이 존재하는 경우

			int userid = (int) session.getAttribute("userid");
			String nickname = (String) session.getAttribute("nickname");

			session.setAttribute("welcome", "님, 맛있는 비밀의 모험을 떠나보세요!");
			String welcome = (String) session.getAttribute("welcome");

			model.addAttribute("userid", userid);
			model.addAttribute("nickname", nickname);
			model.addAttribute("welcome", welcome);

		}

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

	@RequestMapping("/testjoincomp")
	public String testjoincomp() {
		System.out.println("/testjoincomp");
		return "Eunsol/joincomp";
	}

	@RequestMapping("/findid")
	public String finid() {
		System.out.println("/finid");
		return "Eunsol/findid";
	}

	@RequestMapping("/findidcomp")
	public String finidcomp() {
		System.out.println("/finidcomp");
		return "Eunsol/findidcomp";
	}

	@RequestMapping("/testfindpw")
	public String testfindpw() {
		System.out.println("/testfinid");
		return "Eunsol/findpw";
	}

	@RequestMapping("/testfindpwcomp")
	public String testfindpwcomp() {
		System.out.println("/testfinpwcomp");
		return "Eunsol/findpwcomp";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		System.out.println("/logout");
		HttpSession session = req.getSession();
		session.invalidate();
		return "Eunsol/header"; // 메인페이지로 수정
	}

	@RequestMapping("/login_check")
	@ResponseBody
	public Map login_check(HttpServletRequest request, Model model, @ModelAttribute memberDTO DTO) {
		System.out.println("/login_check");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		int loginCheck = member.loginCheck(DTO);
		System.out.println(loginCheck);

		HttpSession session = request.getSession();
		if ((id != null && !id.equals("")) || (pw != null && !pw.equals(""))) {
			System.out.println("id: " + id + "/" + "pw: " + pw);
			if (loginCheck == 1) {
				// 로그인 확인 완료s

				// 세션 가져오기

				// 세션 저장하기
				memberDTO basicInfo = member.basicInfo(DTO);
				String nickname = basicInfo.getNickname();
				int userid = basicInfo.getUserid();

				session.setAttribute("userid", userid);
				session.setAttribute("nickname", nickname);

				Map logincomp = new HashMap();
				logincomp.put("nickname", nickname);
				logincomp.put("url", "/header"); // 메인으로 나중에 수정 요망
				return logincomp;

			} else {
				// 회원정보 없음
				Map map = new HashMap();
				map.put("msg", "아이디나 비밀번호가 올바르지 않습니다.");
				return map;
			}
		} else if (id != null && !id.equals("") && (pw == null || pw.equals(""))) {
			// 아이디는 있고 비밀번호가 없음
			System.out.println("아이디는 있고 비밀번호가 없음");
			Map map = new HashMap();
			map.put("pwNullMsg", "비밀번호를 입력해주세요.");
			return map;
		} else if ((id == null || id.equals("")) && pw != null && !pw.equals("")) {
			// 아이디는 없고 비밀번호는 있음
			System.out.println("아이디는 없고 비밀번호는 있음");
			Map map = new HashMap();
			map.put("idNullMsg", "아이디를 입력해주세요.");
			return map;
		} else {
			// 아이디와 비밀번호 둘 다 없음
			System.out.println("아이디와 비밀번호 둘 다 없음");
			Map map = new HashMap();
			map.put("idNullMsg", "아이디를 입력해주세요.");
			map.put("pwNullMsg", "비밀번호를 입력해주세요.");
			return map;
		}
	}

	@RequestMapping("/profile2")
	public String profile2() {
		System.out.println("/profile2");
		return "Eunsol/profile2";
	}

	// ----------------- 구현
	// 회원가입 페이지
	@RequestMapping("/joinForm")
	public String joinForm(@ModelAttribute memberDTO DTO, Model model) {
		System.out.println("/joinForm");

		return "viewList1";
	}

	// id 중복검사
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id, @ModelAttribute memberDTO DTO) {
		System.out.println("/idcheck");
		int result = member.idCheck(DTO);
		System.out.println("idCheck_result: " + result);
		return result;
	}

	// nickname 중복검사
	@RequestMapping("/nickCheck")
	@ResponseBody
	public int nickCheck(HttpServletRequest req, @ModelAttribute memberDTO DTO) {
		System.out.println("/nickCheck");
		String nick = req.getParameter("nickname");
		int result = member.nicknameCheck(DTO);
		System.out.println("nickCheck_result: " + result);

		return result;
	}

	/*
	 * // 가입하기 버튼 누르면 연결
	 * 
	 * @RequestMapping(value = "/join1", method=RequestMethod.POST) public String
	 * join1(
	 * 
	 * @ModelAttribute memberDTO memberDTO, Model model, HttpServletRequest req ) {
	 * System.out.println("/join"); // 빈 칸 체크 if (memberDTO.getId().isEmpty() ||
	 * idCheck(memberDTO.getId(), memberDTO) == -1 ||memberDTO.getPw().isEmpty() ||
	 * memberDTO.getPw_ck().isEmpty() || memberDTO.getNickname().isEmpty() ||
	 * memberDTO.getEmail().isEmpty()|| emailcheck(memberDTO.getEmail()) != "-1" ||
	 * memberDTO.getGender().isEmpty() || memberDTO.getAge()== -1)
	 * 
	 * { System.out.println("if문에 걸렸"); if(memberDTO.getId().isEmpty()) {
	 * model.addAttribute("errorId", "아이디를 입력해주세요."); }
	 * 
	 * if(idCheck(memberDTO.getId(), memberDTO) == -1) {
	 * System.out.println("join 아이디 중복확인"); model.addAttribute("duId",
	 * "이미 사용중인 아이디 입니다."); }
	 * 
	 * 
	 * if(memberDTO.getPw().isEmpty()) { model.addAttribute("errorPw",
	 * "비밀번호를 입력해주세요."); }
	 * 
	 * if(memberDTO.getPw_ck().isEmpty()) { model.addAttribute("errorPw_ck",
	 * "비밀번호 재확인을 입력해주세요."); }
	 * 
	 * if( memberDTO.getEmail().isEmpty()) { model.addAttribute("errorNickname",
	 * "이메일을 입력해주세요.");}
	 * 
	 * if( emailcheck(memberDTO.getEmail()) != "-1") { model.addAttribute("emMsg",
	 * "이메일을 입력해주세요."); }
	 * 
	 * if( memberDTO.getNickname().isEmpty()) { model.addAttribute("errorEmail",
	 * "별명을 입력해주세요."); }
	 * 
	 * if( memberDTO.getGender()== "-1") { model.addAttribute("errorGender",
	 * "성별을 선택해주세요."); }
	 * 
	 * if( memberDTO.getAge()== -1) { model.addAttribute("errorAge",
	 * "연령대를 선택해주세요."); }
	 * 
	 * return "viewList1"; // 에러가 발생한 JSP 페이지로 이동 }
	 * 
	 * //데이터베이스에 삽입 int result = member.insertMember(memberDTO);
	 * System.out.println("insertMember 결과" + result);
	 * 
	 * //회원가입완료 페이지에 닉네임 뜨게 String nickname = req.getParameter("nickname");
	 * model.addAttribute("nickname", nickname);
	 * 
	 * return "redirect:/joincomp?nickname="+nickname; }
	 */

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public Map join(@ModelAttribute memberDTO memberDTO, Model model, HttpServletRequest req) {
		System.out.println("/join");
		// 빈 칸 체크
		if (memberDTO.getId().isEmpty() || idCheck(memberDTO.getId(), memberDTO) == -1 || memberDTO.getPw().isEmpty()
				|| memberDTO.getPw_ck().isEmpty() || memberDTO.getNickname().isEmpty()
				|| nickCheck(req, memberDTO) == -1 || memberDTO.getEmail().isEmpty()
				|| emailcheck(memberDTO.getEmail()) == "-1" || memberDTO.getGender() == "-1"
				|| memberDTO.getAge() == -1)

		{
			Map errors = validateMember(memberDTO, req);
			/* System.out.println("11111" + errors); */
			System.out.println(memberDTO);
			return errors;
		} else {

			// 데이터베이스에 삽입
			int result = member.insertMember(memberDTO);
			System.out.println("insertMember 결과" + result);

			// 회원가입완료 페이지에 닉네임 뜨게
			String nickname = req.getParameter("nickname");
			/* model.addAttribute("nickname", nickname); */
			Map map = new HashMap();
			map.put("nickname", nickname);
			map.put("result", result);
			map.put("url", "/joincomp");

			return map;
		}
	}

	// 회원가입 완료 페이지
	@RequestMapping("/joincomp")
	public String joincomp(@RequestParam("nickname") String nickname, Model model) {
		model.addAttribute("nickname", nickname);
		return "viewList3";
	}

	// 마이페이지 중 프로필수정
	@RequestMapping("/profile")
	public String profile() {
		System.out.println("/profile");
		return "viewList2";
	}

	// ----------- Java에서 정규식을 사용하여 이메일 주소를 검증하는 방법
	private static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";

	public static boolean validateEmail(String email) {
		Pattern pattern = Pattern.compile(EMAIL_REGEX);
		return pattern.matcher(email).matches();
	}

	public String emailcheck(String email) {
		boolean isValid = validateEmail(email);
		if (isValid) {
			System.out.println("Valid email address");
			return "0"; // 유효
		} else {
			System.out.println("Invalid email address");
			return "-1"; // 유효하지 않음
		}
	}

	public Map validateMember(memberDTO memberDTO, HttpServletRequest req) {
		Map errors = new HashMap();

		if (memberDTO.getId().isEmpty()) {
			errors.put("1 nullError id", "아이디를 입력해주세요.");
		}

		if (idCheck(memberDTO.getId(), memberDTO) == -1) {
			System.out.println("join 아이디 중복확인");
			errors.put("duId", "이미 사용중인 아이디입니다.");
		}

		if (memberDTO.getPw().isEmpty()) {
			errors.put("2 nullError pw", "비밀번호를 입력해주세요.");
		}

		if (memberDTO.getPw_ck().isEmpty()) {
			errors.put("3 nullError pw_ck", "비밀번호 재확인을 입력해주세요.");
		}

		if (memberDTO.getEmail().isEmpty()) {
			errors.put("4 nullError email", "이메일을 입력해주세요.");
		}

		if (!validateEmail(memberDTO.getEmail())) {
			errors.put("emMsg", "유효한 이메일 주소를 입력해주세요.");
		}

		if (memberDTO.getNickname().isEmpty()) {
			errors.put("5 nullError nickname", "별명을 입력해주세요.");
		}

		if (nickCheck(req, memberDTO) == -1) {
			System.out.println("join별명 중복확인");
			errors.put("duNick", "이미 사용중인 별명입니다.");
		}

		if (memberDTO.getGender().equals("-1")) {
			errors.put("6 errorNull gender", "성별을 선택해주세요.");
		}

		if (memberDTO.getAge() == -1) {
			errors.put("7 errorNull age", "연령대를 선택해주세요.");
		}

		return errors;
	}

}
