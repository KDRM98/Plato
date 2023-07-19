package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.postDTO;

@Mapper
public interface postDAO {
	
	int getpostid();

	int insertpost(postDTO dTO);
}