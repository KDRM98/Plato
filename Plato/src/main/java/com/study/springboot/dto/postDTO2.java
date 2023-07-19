package com.study.springboot.dto;

import java.sql.Date;

public class postDTO2 {

	
	private int userid;
	private int postid;
	private String title;
	private Date cdate;
	private int views;
	
	
	private int startNum;
	private int endNum;
	

	private String[] chk;
	
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
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
		this.endNum = endNum;
	}
	public String[] getChk() {
		return chk;
	}
	public void setChk(String[] chk) {
		this.chk = chk;
	}

	

		
	
	}
	
