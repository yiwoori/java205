package com.bitcamp.orl.feed.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.orl.member.domain.*;
import com.bitcamp.orl.member.service.*;

@Controller
@RequestMapping("/feed/feedmain")
public class FeedmainController {
	
	@Autowired
	private RegService regsrvice;
	
	@RequestMapping (method = RequestMethod.GET)
	public String regForm() {
		return "feed/feedmain";
	}
	
	@RequestMapping (method = RequestMethod.POST)
	public String reg(
			MemberRequest memberRequest,
			Model model) {
		
		int result = regsrvice.reg(memberRequest);
		model.addAttribute("result", result);
		
		return "feed/feedmain";
	}

}
