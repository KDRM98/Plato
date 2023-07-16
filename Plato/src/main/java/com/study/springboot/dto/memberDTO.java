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
	

	// 회원정보 변경을 위해 기존 정보 저장
	private String pre_image;
	private String pre_nickname;
	private String pre_email;
	private String pre_gender;
	private int pre_age;
	
	// 비밀번호 변경을 위해 기존 정보 저장
	private String pre_pw;
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public String getPre_nickname() {
		return pre_nickname;
	}
	public void setPre_nickname(String pre_nickname) {
		this.pre_nickname = pre_nickname;
	}
	public String getPre_email() {
		return pre_email;
	}
	public void setPre_email(String pre_email) {
		this.pre_email = pre_email;
	}
	public String getPre_gender() {
		return pre_gender;
	}
	public void setPre_gender(String pre_gender) {
		this.pre_gender = pre_gender;
	}
	public int getPre_age() {
		return pre_age;
	}
	public void setPre_age(int pre_age) {
		this.pre_age = pre_age;
	}
	public String getPre_image() {
		return pre_image;
	}
	public void setPre_image(String pre_image) {
		this.pre_image = pre_image;
	}
	
	
	public String getPre_pw() {
		return pre_pw;
	}
	public void setPre_pw(String pre_pw) {
		pre_pw = pre_pw;
	}
	@Override
	public String toString() {
		return "memberDTO [userid=" + userid + ", admin=" + admin + ", id=" + id + ", pw=" + pw + ", pw_ck=" + pw_ck
				+ ", nickname=" + nickname + ", email=" + email + ", gender=" + gender + ", age=" + age + ", image="
				+ image + ", pre_image=" + pre_image + ", pre_nickname=" + pre_nickname + ", pre_email=" + pre_email
				+ ", pre_gender=" + pre_gender + ", pre_age=" + pre_age + ", Pre_pw=" + pre_pw + "]";
	}

	
	
	}
	
