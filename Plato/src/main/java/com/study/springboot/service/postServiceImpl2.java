package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.postDAO2;
import com.study.springboot.dto.postDTO2;


@Service
public class postServiceImpl2 implements postService2 {

	@Autowired
	postDAO2 DAO2;

	@Override
	public int rough(postDTO2 DTO) {
		int result = DAO2.rough(DTO);
		return result;
	}
	

	
}
