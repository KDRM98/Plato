package com.study.springboot.dto;

public class ingredientDTO {
	private int ingid;
	private String ingredient;
	
	public int getIngid() {
		return ingid;
	}
	public void setIngid(int ingid) {
		this.ingid = ingid;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	
	@Override
	public String toString() {
		return "ingredientDTO [ingid=" + ingid + ", ingredient=" + ingredient + "]";
	}
	
}
