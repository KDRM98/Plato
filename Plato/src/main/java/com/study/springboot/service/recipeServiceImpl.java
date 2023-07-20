package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.recipeDAO;
import com.study.springboot.dto.recipeDTO;

@Service
public class recipeServiceImpl implements recipeService{

	@Autowired
	recipeDAO DAO;
	
	@Override
	public int insertRecipe(recipeDTO dto) {
		int result = DAO.insertRecipe(dto);
		return result;
	}

	@Override
	public List<recipeDTO> getRecipe(int postid) {
		List<recipeDTO> dto = DAO.getRecipe(postid);
		return dto;
	}
	
	

}
