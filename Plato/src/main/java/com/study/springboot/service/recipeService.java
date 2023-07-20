package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.recipeDTO;

public interface recipeService {
	int insertRecipe(recipeDTO dto);
	List<recipeDTO> getRecipe(int postid);
}
