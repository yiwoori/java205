package com.bitcamp.app.member.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.app.member.service.*;

@Controller
public class IdCheckController {
	
	@Autowired
	private IdCheckService checkService;

	@RequestMapping(value="/member/idCheck", method =  RequestMethod.POST)
	public String idCheck(
			@RequestParam("mid") String uid,
			Model model
			) {
		
		model.addAttribute("result",checkService.idCheck(uid));
		
		return "member/idcheck";
	}
	
}