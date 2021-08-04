package com.bitcamp.firstSpring.member.domain;

public class RegRequest {
	
	private String memberid;
	private String password;
	
	
	
	//기본 생성자
	public RegRequest() {}
	
	
	
	//Setter, Getter
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
	@Override
	public String toString() {
		return "RegRequest [memberid=" + memberid + ", password=" + password + "]";
	}
	
	

}
