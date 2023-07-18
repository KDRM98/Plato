package com.study.springboot.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.postDAO2;

import com.study.springboot.dto.postDTO2;


@Service
public class postServiceImpl2 implements postService2 {

	@Autowired
	postDAO2 DAO2;

	@Override
	public int totalCount(postDTO2 DTO) {
		int result = DAO2.totalCount(DTO);
		return result;
	}

	@Override
	public Map gesipan(postDTO2 DTO) {
		List list = DAO2.gesipan(DTO);
		int totalCount = DAO2.totalCount(DTO);
		   Map map = new HashMap();
		   map.put("gsp", list);
		   map.put("totalCount", totalCount);
		   
		   return map;
	
	}

	
	

	
}
