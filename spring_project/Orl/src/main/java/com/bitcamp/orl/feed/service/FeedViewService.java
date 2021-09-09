package com.bitcamp.orl.feed.service;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.orl.feed.dao.*;
import com.bitcamp.orl.feed.domain.*;

@Service
public class FeedViewService {

	private FeedDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 피드 상세보기
	public FeedView getFeedView(int boardIdx) {

		FeedView feedview = null;

		dao = template.getMapper(FeedDao.class);
		feedview = dao.selectFeedView(boardIdx);

		System.out.println("feed view load");

		return feedview;
	}

	//좋아요 상태인지 아닌지 확인
	public int getLikeStatus(int myIdx, int boardIdx) {
		int likeStatus = 0;

		dao = template.getMapper(FeedDao.class);
		likeStatus = dao.selectLikeStatus(myIdx, boardIdx);

		return likeStatus;
	}
	

}
