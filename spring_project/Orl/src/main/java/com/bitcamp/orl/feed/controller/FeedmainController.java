package com.bitcamp.orl.feed.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping ("/feed/feedmain2")
public class FeedmainController {	

	@RequestMapping
	public String getFeedmain() {
		return "feed/feedmain2";
	}

}
