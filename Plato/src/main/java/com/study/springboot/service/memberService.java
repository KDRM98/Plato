package com.study.springboot.service;

import com.study.springboot.dto.memberDTO;

public interface memberService {

	int insertMember(memberDTO DTO);
	int idCheck(memberDTO DTO);
	int nicknameCheck(memberDTO DTO);
	int loginCheck(memberDTO DTO);
	memberDTO basicInfo(memberDTO DTO);
	String findId(memberDTO DTO);
	memberDTO myprofile(memberDTO DTO);
	
	int updateMember(memberDTO DTO);
	
	int pwCheck(memberDTO DTO);
	
	String findPw(memberDTO DTO);
	
	String prePw(memberDTO DTO);
	int updatePw(memberDTO DTO);
}
