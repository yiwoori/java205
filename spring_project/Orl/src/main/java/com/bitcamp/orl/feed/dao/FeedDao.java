package com.bitcamp.orl.feed.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.member.domain.*;

public interface FeedDao {

	// 1. follower수 가져오기
	int selectFollowerCount(int MemberIdx);

	// 2. following 수 가져오기
	int selectFollowingCount(int MemberIdx);

	// 3. follower 리스트 가져오기
	List<FollowList> selectFollowerList(int MemberIdx);

	// 4. follwing 리스트 가져오기
	List<FollowList> selectFollowingList(int memberIdx);

	// 5. 게시물 갯수 가져오기
	int selectFeedCount(int memberIdx);

	// 6. 남피드 출력 위해 필요한 member 객체 가져오기(한행)
	Member selectOneMember(int memberIdx);

	// 7. 팔로우하기와 팔로우 끊기 버튼을 위해 나와 남이 팔로우 상태인지 체크하기
	int selectFollowRelation(int myIdx, int yourIdx);

	// 8. 팔로우 시작하기
	int insertFollowMember(int myIdx, int yourIdx);

	// 9. 팔로우 그만하기
	int deleteFollowMember(int myIdx, int yourIdx);

	// 10. 내 피드 기본 정렬 가져오기
	List<FeedGallery> selectFeedGallery(@Param("memberIdx") int memberIdx);

	// 11. 내 피드 좋아요 정렬 가져오기
	List<FeedLikeGallery> selectFeedLikeGallery(int memberIdx);

	// 12. 좋아요 누른 상태인지 아닌지
	int selectLikeStatus(@Param("myIdx") int myIdx, @Param("boardIdx") int boardIdx);
	
	
	
	
	
	
	
	

	// 피드 작성
	int createFeed(Feed feed);

	// 피드 삭제
	int deleteFeed(@Param("boardIdx") int boardIdx);

	// 피드 수정
	
	// 피드 검색

	// 피드 상세보기
	FeedView selectFeedView(int boardIdx);
	
	// 피드 상세보기 (댓글 작성)
	int insertFeedComment(String comment, int boardIdx, int memberIdx);
	
	// 피드 상세보기 (댓글 리스트)
	List<FeedComment> selectFeedComment(int boardIdx);

	// 전체 피드 리스트 (최신순)
	List<NewFeedList> selectNewFeed();

	// 전체 피드 리스트 (인기순)

}