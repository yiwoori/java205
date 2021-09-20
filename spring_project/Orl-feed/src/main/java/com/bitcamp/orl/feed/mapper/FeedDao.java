package com.bitcamp.orl.feed.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.bitcamp.orl.feed.domain.*;

public interface FeedDao {

	// 피드 삭제
	int deleteFeed(@Param("memberIdx") int memberIdx, @Param("boardIdx") int boardIdx);

	// 댓글 삭제
	int deleteComment(@Param("boardCommentIdx") int boardCommentIdx);

	// 피드 댓글 리스트
	List<FeedComment> selectFeedComment(@Param("boardIdx") int boardIdx);

	// 전체 피드 리스트 (최신순)
	List<NewFeedList> selectNewFeed();
	
	// 추가 (09.18.우리)
	// 특정 피드 선택
	Feed selectFeed(@Param("boardIdx") int boardIdx);
	
	// 추가 (09.18.우리)
	// 닉네임 중복 체크
	int selectByNickname(@Param("memberNickname") String memberNickname);
	
	
	
	// 산별 피드보기(용민)
	List<NewFeedList> selectNewFeedByMountain(@Param("mName") String mName);

}
