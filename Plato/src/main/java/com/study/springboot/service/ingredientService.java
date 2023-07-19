package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.ingredientDTO;

public interface ingredientService {

	 int insertIngredient(String ingredient);
	 int insertInges(ingredientDTO dto);
	 int selectIngIDByName(String ingredient);
	 int deleteIngredient(int ingid);
	 List<ingredientDTO> selectIngredientAll();
	 List<ingredientDTO> selectIngredientByRecipeId(int recipeId);
}
