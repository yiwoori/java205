package com.bitcamp.firstSpring.member.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberMyPageController {
	
	@RequestMapping("/member/mypage/{id}")	//id : 변수처럼 값 사용(아이디에 따라 변경)
	public String mypage(
			
			@PathVariable("id") String uid,
			Model model
			
			) {
		
		System.out.println(uid);
		model.addAttribute("userId", uid);
		
		return "member/mypage";
	}

}
