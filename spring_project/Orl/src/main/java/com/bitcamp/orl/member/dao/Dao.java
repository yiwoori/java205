package com.bitcamp.orl.member.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.bitcamp.orl.member.domain.*;

public interface Dao {
	
	List<Member> selectAll();
	
	int insertMember(Member member);

	Member selectByIdPw(@Param("memberId")String memberId, @Param("memberPw")String memberPw);
}
