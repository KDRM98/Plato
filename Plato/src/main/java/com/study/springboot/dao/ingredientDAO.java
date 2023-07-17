package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ingredientDTO;

@Mapper
public interface ingredientDAO {
	 int insertIngredient(String ingredient);
	 int deleteIngredient(int ingid);
	 List<ingredientDTO> selectIngredientAll();
	 List<ingredientDTO> selectIngredientByRecipeId(int recipeId);
}
