package com.study.springboot.service;

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

		// id가 이미 있는지 검사
		int countId = DAO.idCheck(DTO);

		if (countId == 0) {
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

}
