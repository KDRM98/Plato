package com.study.springboot.dto;

public class likeDTO {

	private int likeid;
	private int userid;
	private int postid;
	
	public int getLikeid() {
		return likeid;
	}
	public void setLikeid(int likeid) {
		this.likeid = likeid;
	}
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
	
	@Override
	public String toString() {
		return "likeDTO [likeid=" + likeid + ", userid=" + userid + ", postid=" + postid + "]";
	}
	
}
