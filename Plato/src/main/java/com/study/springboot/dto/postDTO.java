package com.study.springboot.dto;

import java.util.List;

public class postDTO {
	private int postid;
	private int writerId;
	private String title;
	private String timg;
	private String info;
	private String ytblink;
	private int time;
	private int Diff;
	private List<recipeDTO> instruction;
	private List<ingredientDTO> ingredient;
	private List<commentDTO> comment;
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getYtblink() {
		return ytblink;
	}
	public void setYtblink(String ytblink) {
		this.ytblink = ytblink;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getDiff() {
		return Diff;
	}
	public void setDiff(int diff) {
		Diff = diff;
	}
	public List<recipeDTO> getInstruction() {
		return instruction;
	}
	public void setInstruction(List<recipeDTO> instruction) {
		this.instruction = instruction;
	}
	public List<ingredientDTO> getIngredient() {
		return ingredient;
	}
	public void setIngredient(List<ingredientDTO> ingredient) {
		this.ingredient = ingredient;
	}
	public List<commentDTO> getComment() {
		return comment;
	}
	public void setComment(List<commentDTO> comment) {
		this.comment = comment;
	}
	
	
	
	
	// DTO는 각각 다 선언을 해주고 이 recipeDTO에 List<instructionDTO> 이런식으로 다른 서브 DTO를 여기에 담는 방식으로 해서 불러올때 한번에 불러오게.
}
