package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.postDTO2;

@Mapper
public interface postDAO2 {
	
	
	int totalCount(postDTO2 DTO);
	List<postDTO2> gesipan(postDTO2 DTO);

	
	
}
