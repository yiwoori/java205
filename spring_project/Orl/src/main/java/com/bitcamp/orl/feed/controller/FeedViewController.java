package com.bitcamp.orl.feed.controller;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.feed.service.*;
import com.bitcamp.orl.member.domain.*;

@Controller
@RequestMapping("/feed/feedview/{memberIdx}&{boardIdx}")
public class FeedViewController {

	@Autowired
	FeedViewService viewService;
	
	@Autowired
	private FeedCommentService commentService;
	
	@Autowired
	private FeedCommentingService commentingService;

	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getFeedView(
         @PathVariable("memberIdx") int memberIdx,
         @PathVariable("boardIdx") int boardIdx,
         HttpServletRequest request,
         Model model
         ) {

      // 피드 상세
      FeedView feedview = viewService.getFeedView(boardIdx);
      model.addAttribute("selectFeedView", viewService.getFeedView(boardIdx));
      System.out.println("feedview controller => "+feedview);

      // session에 있는 나의 memberIdx 필요
       MemberVo memberVo = (MemberVo) request.getSession().getAttribute("memberVo");
       int myIdx = memberVo.getMemberIdx();
       //1. 첫 요청에 하트의 결과를  보여줘야한다. 내가 이 게시물을 좋아요 하는지 안 하는지!
        int likeStatus = viewService.getLikeStatus(myIdx,boardIdx);
       //모델에 저장
       model.addAttribute("likeStatus",likeStatus);
      
      return "/feed/feedview";
      
   }

	
	
	@RequestMapping(method = RequestMethod.POST)
	public String getFeedView2(
			@PathVariable("boardIdx") int boardIdx,
			@PathVariable("memberIdx") int memberIdx,
			FeedCommentRequest commentRequest,
			HttpServletRequest request,
			Model model
			) {
		
	      // 피드 상세보기
	      FeedView feedview = viewService.getFeedView(boardIdx);
	      model.addAttribute("selectFeedView", viewService.getFeedView(boardIdx));
	      System.out.println("feedview controller => "+feedview);
	      
	      commentingService.insertComment(commentRequest, request);

			//댓글 작성
			model.addAttribute("boardCommentIdx", commentRequest.getBoardCommentIdx());
			model.addAttribute("comment", commentRequest.getComment());
			model.addAttribute("boardIdx", commentRequest.getBoardIdx());
			model.addAttribute("memberIdx", commentRequest.getMemberIdx());
		
		return "/feed/feedview";
	}

	
	//피드 수정
	@RequestMapping(value = "/feed/feededit/{boardIdx}", method = RequestMethod.POST)
	public String editFeed(
			@PathVariable("boardIdx") int boardIdx,
			FeedEdit feedEdit,
			HttpServletRequest request,
			Model model
			) {
		
		int result = viewService.editFeed(boardIdx, feedEdit, request);
		
		model.addAttribute("boardDiscription", feedEdit.getBoardDiscription());
		model.addAttribute("hashtag", feedEdit.getHashtag());
		model.addAttribute("tag", feedEdit.getTag());
		
		return "/feed/feedview";
	}
	
	
}
