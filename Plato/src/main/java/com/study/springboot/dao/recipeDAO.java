package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.recipeDTO;

@Mapper
public interface recipeDAO {
	int insertRecipe(recipeDTO dto);
}
