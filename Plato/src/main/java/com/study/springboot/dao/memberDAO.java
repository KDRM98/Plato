package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.memberDTO;

@Mapper
public interface memberDAO {
	
	int insertMember(memberDTO DTO);
	int idCheck(memberDTO DTO);
	int nicknameCheck(memberDTO DTO);
	int loginCheck(memberDTO DTO);
	memberDTO basicInfo(memberDTO DTO);
	String findId(memberDTO DTO);
	String findPw(memberDTO DTO);
	memberDTO myprofile(memberDTO DTO);
	
	int updateMember(memberDTO DTO);
	int pwCheck(memberDTO DTO);
	
	
}
