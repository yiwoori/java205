package com.bitcamp.op.member.domain;

import org.springframework.web.multipart.*;

public class MemberRegRequest {

	private String memberid;
	private String password;
	private String membername;
	private MultipartFile photo;
	
	public MemberRegRequest(){}

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

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "RegRequest [memberid=" + memberid + ", password=" + password + ", membername=" + membername
				+ ", memberPhoto=" + photo.getOriginalFilename() + "]";
	}
	
	// MemberRegRequest -> Member
	public Member toMemter() {
		return new Member(
				0,
				memberid,
				password,
				membername,
				photo.getOriginalFilename(),
				null);
	}
	
}
