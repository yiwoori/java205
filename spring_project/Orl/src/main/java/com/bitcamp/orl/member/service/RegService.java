package com.bitcamp.orl.member.service;
import java.sql.*;
import java.text.*;

import javax.servlet.http.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.orl.member.dao.*;
import com.bitcamp.orl.member.domain.*;

@Service
public class RegService {
	
	private Dao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int reg(
			MemberRequest memberRequest //커맨드 객체
			) {
		
		int resultCnt = 0;
		
        try {
    		Member member = new Member();
    		
    		//regForm ->
    		member.setMemberId(memberRequest.getMemberId());
            member.setMemberPw(memberRequest.getMemberPw());
            member.setMemberName(memberRequest.getMemberName());
            member.setMemberEmail(memberRequest.getMemberEmail());
            member.setMemberNickname(memberRequest.getMemberNickname());
			member.setMemberBirth(memberRequest.getMemberBirth());
			
			dao = template.getMapper(Dao.class);
			resultCnt = dao.insertMember(member);	//insert된 값(1)
			
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultCnt;
	}

}
