package com.study.springboot.dto;

public class ingredientDTO {
	private int postid;
	private int ingid;
	private String ing;
	private String ingamt;
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	
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
	
	public String getingamt() {
		return ingamt;
	}
	public void setingamt(String ingamt) {
		this.ingamt = ingamt;
	}
	@Override
	public String toString() {
		return "ingredientDTO [ingid=" + ingid + ", ingredient=" + ing + ", ingamt=" + ingamt + "]";
	}
	
	
	
}
