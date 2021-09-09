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

      // 피드 상세보기
      FeedView feedview = viewService.getFeedView(boardIdx);
      model.addAttribute("selectFeedView", viewService.getFeedView(boardIdx));
      System.out.println(feedview);
      
      // 피드 댓글 보기			 //비동기통신 추가**************		
      List<FeedComment> feedComments = commentService.getFeedComment(boardIdx);
      model.addAttribute("selectFeedComment", commentService.getFeedComment(boardIdx));
     
      
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
			HttpServletRequest request,
			Model model
			) {
		
		String comment = request.getParameter("comment");
		
		commentingService.insertComment(request, boardIdx, comment);
		System.out.println(comment);
		
		return "/feed/feedview";
	}

	
	
}
