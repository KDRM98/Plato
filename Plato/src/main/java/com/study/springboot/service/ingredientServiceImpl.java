package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ingredientDAO;
import com.study.springboot.dto.ingredientDTO;

@Service
public class ingredientServiceImpl implements ingredientService{
	
	@Autowired
	ingredientDAO DAO;
	
	@Override
	public int insertIngredient(String ingredient) {
		int result = DAO.insertIngredient(ingredient);
		return result;
	}

	@Override
	public int deleteIngredient(int ingid) {
		int result = DAO.deleteIngredient(ingid);
		return result;
	}

	@Override
	public List<ingredientDTO> selectIngredientAll() {
		List<ingredientDTO> ingredientList = DAO.selectIngredientAll();
		return ingredientList;
	}

	@Override
	public List<ingredientDTO> selectIngredientByRecipeId(int recipeId) {
		return DAO.selectIngredientByRecipeId(recipeId);
	}

	@Override
	public int insertInges(ingredientDTO dto) {
		int result = DAO.insertInges(dto);
		return result;
	}

	@Override
	public int selectIngIDByName(String ingredient) {
		int result = DAO.selectIngIDByName(ingredient);
		return result;
	}

}
