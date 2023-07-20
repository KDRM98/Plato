package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.recipeDTO;

@Mapper
public interface recipeDAO {
	int insertRecipe(recipeDTO dto);
	
	List<recipeDTO> getRecipe(int postid);
}
