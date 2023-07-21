package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.likeDTO;

@Mapper
public interface likeDAO {
	int getpostliked(likeDTO dto);
	int getisliked(likeDTO dto);
	int insertlike(likeDTO dto);
	int deletelike(likeDTO dto);
}
