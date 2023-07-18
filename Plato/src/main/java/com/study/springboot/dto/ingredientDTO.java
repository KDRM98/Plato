package com.study.springboot.dto;

public class ingredientDTO {
	private int ingid;
	private String ing;
	private String ingamount;
	
	public int getIngid() {
		return ingid;
	}
	public void setIngid(int ingid) {
		this.ingid = ingid;
	}
	public String getIngredient() {
		return ing;
	}
	public void setIngredient(String ingredient) {
		this.ing = ingredient;
	}
	
	public String getIngamount() {
		return ingamount;
	}
	public void setIngamount(String ingamount) {
		this.ingamount = ingamount;
	}
	@Override
	public String toString() {
		return "ingredientDTO [ingid=" + ingid + ", ingredient=" + ing + ", ingamount=" + ingamount + "]";
	}
	
	
	
}
