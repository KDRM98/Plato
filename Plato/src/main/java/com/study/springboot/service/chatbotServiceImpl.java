package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.chatbotDAO;
import com.study.springboot.dto.chatbotDTO;

@Service
public class chatbotServiceImpl implements chatbotService{

	@Autowired
	chatbotDAO dao;

	@Override
	public Map infoKeyword(chatbotDTO dto) {
		List list = dao.infoKeyword(dto);
		int totalCount = dao.countkeyword(dto);
		   Map map = new HashMap();
		   map.put("keyResult", list);
		   map.put("totalCount", totalCount);
		   
		   return map;

	}
	


}
