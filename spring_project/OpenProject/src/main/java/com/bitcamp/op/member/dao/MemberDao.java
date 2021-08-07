package com.bitcamp.op.member.dao;

import org.springframework.stereotype.*;

@Repository //Dao=@Repository로 bean 생성
public class MemberDao {
	
	public void login() {
		System.out.println("로그인");
	}

}
