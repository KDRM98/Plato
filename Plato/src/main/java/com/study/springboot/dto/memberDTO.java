package com.study.springboot.dto;

import java.sql.Date;

public class memberDTO {

	
	private int userid;
	private int admin;	
	private String id;
	private String pw;
	private String pw_ck;	
	private String nickname;
	private String email;
	private String gender = "-1";
	private int age = -1;
	private String image;
	
	
	public int getUserid() {
		return userid;
	}
	public void setUser_id(int user_id) {
		this.userid = user_id;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getPw_ck() {
		return pw_ck;
	}
	public void setPw_ck(String pw_ck) {
		this.pw_ck = pw_ck;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "memberDTO [userid=" + userid + ", admin=" + admin + ", id=" + id + ", pw=" + pw + ", pw_ck=" + pw_ck
				+ ", nickname=" + nickname + ", email=" + email + ", gender=" + gender + ", age=" + age + ", image="
				+ image + "]";
	}
	

	
	
	
		
}
