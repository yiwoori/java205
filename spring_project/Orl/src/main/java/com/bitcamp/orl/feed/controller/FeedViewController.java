package com.bitcamp.orl.feed.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.orl.feed.domain.FeedCommentRequest;
import com.bitcamp.orl.feed.domain.FeedEdit;
import com.bitcamp.orl.feed.service.FeedViewService;
import com.bitcamp.orl.member.domain.MemberDto;

@Controller
public class FeedViewController {

	// 피드 상세보기 페이지

	@Autowired
	private FeedViewService viewService;

	@RequestMapping("/feed/feedview/{memberIdx}&{boardIdx}")
	public String getFeedView(
			@PathVariable("memberIdx") int memberIdx,
			@PathVariable("boardIdx") int boardIdx,
			HttpServletRequest request,
			Model model) {
		
		// session에 있는 나의 memberIdx 필요
		int myIdx = ((MemberDto) request.getSession().getAttribute("memberVo")).getMemberIdx();
		// 하트 상태
		int likeStatus = viewService.getLikeStatus(myIdx, boardIdx);
		int totalLikeCount = viewService.getTotalLikeCount(boardIdx);
		
		// 모델에 저장
		model.addAttribute("selectFeedView", viewService.getFeedView(boardIdx));
		model.addAttribute("totalLikeCount", totalLikeCount);
		model.addAttribute("likeStatus", likeStatus);
		model.addAttribute("boardMemberIdx", memberIdx);

		return "/feed/feedview";

	}

	@RequestMapping(value="/feed/feedview/{memberIdx}&{boardIdx}", method = RequestMethod.POST)
	public String postFeedView(
			@PathVariable("memberIdx") int memberIdx,
			@PathVariable("boardIdx") int boardIdx,
			FeedCommentRequest commentRequest,
			HttpServletRequest request,
			Model model) {
		
		// 댓글 작성 insert
		viewService.insertComment(commentRequest, request);

		return "redirect:/feed/feedview/"+memberIdx+"&"+boardIdx;
	}
	
	
}