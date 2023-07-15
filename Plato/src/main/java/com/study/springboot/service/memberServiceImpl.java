package com.study.springboot.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.study.springboot.dao.memberDAO;
import com.study.springboot.dto.memberDTO;

@Service
public class memberServiceImpl implements memberService {

	@Autowired
	memberDAO DAO;

	@Override
	public int insertMember(memberDTO DTO) {
		int result = DAO.insertMember(DTO);
		return result;
	}

	@Override
	public int idCheck(memberDTO DTO) {
		int result = -1; // 아이디 중복
		int join_id = -3;// 가입하기 비활성화
		// id가 이미 있는지 검사
		int countId = DAO.idCheck(DTO);

		if (countId == 0) {
			// id가 중복되지 않음
			result = 0;
			join_id = 0;
			// result에는 1(insert 성공)
		} else {
			// id가 이미 존재한다면
			result = -1;
		}
		return result;
	}

	@Override
	public int nicknameCheck(memberDTO DTO) {
		System.out.println("nicknameCheck 서비스");

		
		int result = -1; // 아이디 중복

		System.out.println(DTO.getNickname());
		// id가 이미 있는지 검사
		int countNick = DAO.nicknameCheck(DTO);
		System.out.println("countNick :" + countNick);
		if (countNick == 0) {
			// id가 중복되지 않음
			result = 0;

			// result에는 1(insert 성공)
		} else {
			// id가 이미 존재한다면
			result = -1;

		}
		
		return result;
	}

	@Override
	public int loginCheck(memberDTO DTO) {
		System.out.println("loginCheck 서비스");
		int loginCheck = DAO.loginCheck(DTO);
		System.out.println(loginCheck);
		return loginCheck;
	}

	@Override
	public memberDTO basicInfo(memberDTO DTO) {
		System.out.println("basicInfo 서비스");
		memberDTO result = DAO.basicInfo(DTO);
		
		System.out.println(result);
		return result;
	}

	@Override
	public String findId(memberDTO DTO) {
		System.out.println("findId 서비스");
		String result = DAO.findId(DTO);
		return result;
	}

	@Override
	public memberDTO myprofile(memberDTO DTO) {
		memberDTO result = DAO.myprofile(DTO);
		return result;
	}

	@Override
	public int updateMember(memberDTO DTO) {
		int result = DAO.updateMember(DTO);
		return result;
	}

	@Override
	public int pwCheck(memberDTO DTO) {
		System.out.println("pwCheck 서비스");
		int result = DAO.pwCheck(DTO);
		return result;
	}

	@Override
	public String findPw(memberDTO DTO) {
		System.out.println("findpw 서비스");
		String result = DAO.findPw(DTO);
		return result;
	}

	@Override
	public String prePw(memberDTO DTO) {
		System.out.println("prePw 서비스");
		String result = DAO.prePw(DTO);
		/* System.out.println(result); */
		return result;
	}

	@Override
	public int updatePw(memberDTO DTO) {
		System.out.println("prePw 서비스");
		int result = DAO.updatePw(DTO);
		return result;
	}
	
	

}
