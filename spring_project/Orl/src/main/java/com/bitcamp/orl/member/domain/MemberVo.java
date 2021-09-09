package com.bitcamp.orl.member.domain;

public class MemberVo {

	private int memberIdx;
	private String memberNickname;
	
	public MemberVo() {
		
	}

	public MemberVo(int memberIdx, String memberNickname) {
		this.memberIdx = memberIdx;
		this.memberNickname = memberNickname;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "MemberVo{" + "memberIdx=" + memberIdx + ", memberNickname='" + memberNickname + '\'' + '}';
	}
}