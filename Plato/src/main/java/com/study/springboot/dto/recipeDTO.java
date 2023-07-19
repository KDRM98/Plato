package com.study.springboot.dto;

public class recipeDTO {

	private int postid;
	private int recipeid;
	

	// 조리내용
	private String recipeinfo;
	// 조리 사진
	private String recipeimg;
	// 조리순서
	private int recipeOrder;

	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public int getRecipeOrder() {
		return recipeOrder;
	}
	public void setRecipeOrder(int recipeOrder) {
		this.recipeOrder = recipeOrder;
	}
	public String getRecipeinfo() {
		return recipeinfo;
	}
	public void setRecipeinfo(String recipeinfo) {
		this.recipeinfo = recipeinfo;
	}
	public String getRecipeimg() {
		return recipeimg;
	}
	public void setRecipeimg(String recipeimg) {
		this.recipeimg = recipeimg;
	}
	
}
