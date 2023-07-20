package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ingredientDTO;

@Mapper
public interface ingredientDAO {
	 int insertIngredient(String ingredient);
	 int insertInges(ingredientDTO dto);
	 int deleteIngredient(int ingid);
	 int selectIngIDByName(String ingredient);
	 List<ingredientDTO> selectIngredientAll();
	 List<ingredientDTO> selectIngredientByRecipeId(int postid);
}
