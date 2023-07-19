package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.postDAO;
import com.study.springboot.dto.postDTO;

@Service
public class postServiceImpl implements postService{

	@Autowired
	postDAO DAO;
	
	@Override
	public int insertpost(postDTO DTO) {
		
		int result = DAO.insertpost(DTO);
		return result;
	}

	@Override
	public int getpostid() {
		int result = DAO.getpostid();
		return result;
	}
	
}
