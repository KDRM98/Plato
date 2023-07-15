package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;


import com.study.springboot.dto.postDTO2;

@Mapper
public interface postDAO2 {
	
	
	int rough(postDTO2 DTO);


	
	
}
