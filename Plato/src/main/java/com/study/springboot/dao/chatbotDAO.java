package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.chatbotDTO;


@Mapper
public interface chatbotDAO {

	List<chatbotDTO> infoKeyword(chatbotDTO dto);
	int countkeyword(chatbotDTO dto);
}
