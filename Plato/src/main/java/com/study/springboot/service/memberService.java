package com.study.springboot.service;

import com.study.springboot.dto.memberDTO;

public interface memberService {

	int insertMember(memberDTO DTO);
	int idCheck(memberDTO DTO);
	int nicknameCheck(memberDTO DTO);
}
