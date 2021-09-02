package com.bitcamp.orl.feed.controller;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.feed.service.*;

@Controller
public class CreateFeedController {

	@Autowired
	private CreateFeedService createService;

	@RequestMapping("/feed/createfeed2")
	public String getCreateFeedForm() {
		return "feed/createfeed2";
	}

	@RequestMapping("/feed/feedview")
	public String upload3(Feed feed, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		model.addAttribute("boardPhoto", feed.getBoardPhoto());
		model.addAttribute("boardDiscription", feed.getBoardDiscription());
		model.addAttribute("hashtag", feed.getHashtag());
		model.addAttribute("tag", feed.getTag());

		return "feed/feedview";
	}



}
