package com.study.springboot.dto;

public class chatbotDTO {
	
	private int startNum;
	private int endNum;

	private String info;
	private String title;
	private String mnp;
	private int postid;
	
	

	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMnp() {
		return mnp;
	}
	public void setMnp(String mnp) {
		this.mnp = mnp;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;}
	
	
}
