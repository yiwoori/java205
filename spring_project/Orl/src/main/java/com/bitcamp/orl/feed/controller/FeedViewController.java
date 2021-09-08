package com.bitcamp.orl.feed.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/feed/feedview/{memberIdx}&{boardIdx}")
public class FeedViewController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getFeedView(
			@PathVariable("memberIdx") int memberIdx,
			@PathVariable("boardIdx") int boardIdx
			) {
		
		//member -> memberIdx, memberNickname
		//boardPhoto -> boardIdx, boardPhoto
		
		
		
		return "feed/feedview";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getFeedView2() {
		return "feed/feedview";
	}

}
