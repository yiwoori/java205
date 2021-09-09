package com.bitcamp.orl.feed.service;

import javax.servlet.http.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.orl.feed.dao.*;
import com.bitcamp.orl.member.domain.*;

@Service
public class FeedCommentingService {

	FeedDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 피드 댓글 작성
	public int insertComment(HttpServletRequest request, int boardIdx, String comment) {

		int result = 0;

		MemberVo memberVo = (MemberVo) (request.getSession().getAttribute("memberVo"));
		int memberIdx = memberVo.getMemberIdx();

		dao = template.getMapper(FeedDao.class);
		result = dao.insertFeedComment(comment, boardIdx, memberIdx);

		return result;

	}

}
