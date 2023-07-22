package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.postDTO;

@Mapper
public interface postDAO {
	
	int getpostid();

	int insertpost(postDTO dto);
	
	int viewup(postDTO dto);
	
	postDTO getpost(int postid);
	
	List<postDTO> getallpost(String title);
}