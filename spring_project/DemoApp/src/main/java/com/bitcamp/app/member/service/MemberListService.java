package com.bitcamp.app.member.service;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.app.member.domain.*;
import com.bitcamp.app.member.mapper.*;

@Service
public class MemberListService {

	private MemberMapper dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Member> getMemberList(){
		return template.getMapper(MemberMapper.class).selectAll();
	}

	public List<Member> getMemberList(SearchType searchType){
		return template.getMapper(MemberMapper.class).selectMember(searchType);
	}
}