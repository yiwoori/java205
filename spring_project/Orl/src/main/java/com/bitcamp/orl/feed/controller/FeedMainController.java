package com.bitcamp.orl.feed.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.feed.service.*;

@Controller
@RequestMapping("/feed/feedmain")
public class FeedMainController {

	@Autowired
	private CreateFeedService createService;

	@Autowired
	private FeedListService listservice;

	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getFeedMain(Model model) {
		
		//피드 기본 정렬
		List<NewFeedList> newFeedList = listservice.selectNewFeed();
		model.addAttribute("selectNewFeed", listservice.selectNewFeed());
		
		return "feed/feedmain";
	}

	
	
	@RequestMapping(method = RequestMethod.POST)
	public String getFeedMainPost(
			FeedCreateRequest feedrequest, 
			HttpServletRequest request,
			Model model)
			throws IllegalStateException, IOException {
		
		//피드 기본 정렬
		List<NewFeedList> newFeedList = listservice.selectNewFeed();
		model.addAttribute("selectNewFeed", listservice.selectNewFeed());
		//비동기통신 추가
		
		//피드 작성
		model.addAttribute("boardPhoto", feedrequest.getBoardPhoto());
		model.addAttribute("boardDiscription", feedrequest.getBoardDiscription());
		model.addAttribute("hashtag", feedrequest.getHashtag());
		model.addAttribute("tag", feedrequest.getTag());
		createService.insert(feedrequest, request);

		return "feed/feedmain";
	}

	
	
}
