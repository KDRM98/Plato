package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.postDTO2;


public interface postService2 {

	int totalCount(postDTO2 DTO);
	
	Map gesipan(postDTO2 DTO);
}
