package com.bitcamp.firstSpring.member.domain;

public class LoginRequest {
	
	//beans 생성
	private String id; //<form id>와 일치
	private String pw;
	
	
	
	//기본 생성자 필수
	public LoginRequest() {}
	
	// setter/getter
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
	
	
	
	@Override
	public String toString() {
		return "LoginRequest [id=" + id + ", pw=" + pw + "]";
	}

	
	
}
