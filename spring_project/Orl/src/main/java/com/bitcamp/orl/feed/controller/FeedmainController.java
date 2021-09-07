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
	public String getCreateFeedForm(Model model) {
		
//		//피드 기본 정렬
//		List<NewFeedList> newFeedList = null;
//		newFeedList = listservice.getNewFeed();
//		model.addAttribute("newFeedList", newFeedList);
		
		List<NewFeedList> newFeedList = listservice.selectNewFeed();
		model.addAttribute("selectNewFeed", listservice.selectNewFeed());
		
		return "feed/feedmain";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String upload(FeedCreateRequest feedrequest, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		//피드 기본 정렬
//		List<NewFeedList> newFeedList = listservice.getNewFeed();
//		model.addAttribute("newFeedList", newFeedList);
		
		//Form input data
		model.addAttribute("boardPhoto", feedrequest.getBoardPhoto());
		model.addAttribute("boardDiscription", feedrequest.getBoardDiscription());
		model.addAttribute("hashtag", feedrequest.getHashtag());
		model.addAttribute("tag", feedrequest.getTag());
		//data insert
		createService.insert(feedrequest, request);

		return "feed/feedmain";
	}

}
