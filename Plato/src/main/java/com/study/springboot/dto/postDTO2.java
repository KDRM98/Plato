package com.study.springboot.dto;

import java.sql.Date;

public class postDTO2 {

	
	private int userid;
	private int postid;
	private String title;
	private Date CDate;
	private int views;
	
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
	public Date getCDate() {
		return CDate;
	}
	public void setCDate(Date cDate) {
		CDate = cDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	@Override
	public String toString() {
		return "postDTO2 [userid=" + userid + ", postid=" + postid + ", title=" + title + ", CDate=" + CDate
				+ ", views=" + views + "]";
	}	
	
		
	
	}
	
