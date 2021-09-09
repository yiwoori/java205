package com.bitcamp.orl.feed.domain;

public class FeedComment {
	
	//피드 상세보기 (댓글)
	private int boardCommnetIdx;
	private String comment;
	private int boardIdx;
	private int memberIdx;
	private String memberNickname;
	private String memberProfile;
	
	public FeedComment(){
		
	}

	public FeedComment(int boardCommnetIdx, String comment, int boardIdx, int memberIdx, String memberNickname,
			String memberProfile) {
		this.boardCommnetIdx = boardCommnetIdx;
		this.comment = comment;
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
		this.memberNickname = memberNickname;
		this.memberProfile = memberProfile;
	}

	public int getBoardCommnetIdx() {
		return boardCommnetIdx;
	}

	public void setBoardCommnetIdx(int boardCommnetIdx) {
		this.boardCommnetIdx = boardCommnetIdx;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
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

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	@Override
	public String toString() {
		return "FeedComment [boardCommnetIdx=" + boardCommnetIdx + ", comment=" + comment + ", boardIdx=" + boardIdx
				+ ", memberIdx=" + memberIdx + ", memberNickname=" + memberNickname + ", memberProfile=" + memberProfile
				+ "]";
	}

}
