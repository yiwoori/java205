package com.bitcamp.orl.feed.controller;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.feed.service.*;
import com.bitcamp.orl.member.domain.*;

@RestController
public class FeedRestController {
	
	@Autowired
	FeedManageService manageService;
	
	@Autowired
	FeedListService listService;
	
	@Autowired
	FeedCommentingService commentingService;
	
	//피드 삭제
	@RequestMapping("/feed/feedview/deletefeed/{memberIdx}&{boardIdx}")
	public int deleteFeed(
		@PathVariable("memberIdx") int memberIdx,
		@PathVariable("boardIdx") int boardIdx,
		HttpServletRequest request
		) {
		
		int result = 0;

		int myIdx = ((MemberVo) request.getSession().getAttribute("memberVo")).getMemberIdx();

		if(memberIdx == myIdx) {
			result = manageService.deleteFeed(memberIdx, boardIdx);	//1 or 0
			System.out.println("삭제 피드 : " + boardIdx);
		} else {
			//피드 작성자가 아니므로 삭제 불가
			System.out.println("피드 작성자 불일치 (feed creator Idx : " + memberIdx + " )");
		}
		
		return result;
	}	
	
//	//피드 수정
//	@RequestMapping("/feed/feedview/editfeed/{boardIdx}")
//	public int editFeed(
//			@PathVariable("boardIdx") int boardIdx,
//			HttpServletRequest request
//			) {
//		
//		int result = 0;
//		
//		result = manageService.editFeed(boardIdx);
//		System.out.println("수정 내용 : " + result);
//		
//		return result;
//		
//	}
	
	//피드 댓글 수정
	@RequestMapping("/feed/feedview/editcomment/{memberIdx}&{boardCommentIdx}&{comment}")
	public int editComment(
			@PathVariable("memberIdx") int memberIdx,
			@PathVariable("boardCommentIdx") int boardCommentIdx,
			@PathVariable("comment") String comment,
			HttpServletRequest request
			) {
		
		int result = 0;
			
		result = manageService.editComment(comment, boardCommentIdx);
		System.out.println("수정 내용 : " + comment);
		
		return result;
	}
	
	//피드 댓글 삭제
	@RequestMapping("/feed/feedview/deletecomment/{boardCommentIdx}&{boardIdx}")
	public List<FeedComment> deleteComment(
			@PathVariable("boardCommentIdx") int boardCommentIdx,
			@PathVariable("boardIdx") int boardIdx,
			HttpServletRequest request
			) {
		manageService.deleteComment(boardCommentIdx);	//1
		System.err.println("삭제 댓글 : " + boardCommentIdx);
		System.out.println(boardIdx);
		List<FeedComment> feedComment = manageService.selectFeedComment(boardIdx);
		return feedComment;
	}
	
	//피드 리스트 (최신순)
	@RequestMapping("/feed/feedmain/selectNewFeed")
	public List<NewFeedList> newFeedList (HttpServletRequest request){
		
		System.out.println("restcontroller - new feed list load");
		
		List<NewFeedList> feedlist = manageService.selectNewFeed();
		System.out.println("rest controller =>" + feedlist);
		return feedlist;
	}
	
	//댓글 리스트
	@GetMapping("/feed/feedview/selectcomment")
	public List<FeedComment> selectComments(HttpServletRequest request) {
		
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		
		System.out.println("restcontroller - comment list load");
		List<FeedComment> feedComment = manageService.selectFeedComment(boardIdx);
		System.out.println(boardIdx);
		System.out.println("rest controller => "+feedComment);
		
		return feedComment;
		
	}

}
