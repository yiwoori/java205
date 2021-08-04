package com.bitcamp.firstSpring.member.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.firstSpring.member.domain.*;

@Controller
@RequestMapping("/member/regform")
public class MemberRegController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getRegForm(@RequestParam(value="page", defaultValue = "1") int page) {
		
		System.out.println(page);
		return "member/memberRegForm"; //get일때는 그대로 나오고 post일때는 사용자가 입력한 방식으로 나오게
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String memberReg(
			@RequestParam("memberid") String memberid,
			@RequestParam("password") String password,
			HttpServletRequest request,
			@ModelAttribute("memberReg") RegRequest regRequest,
			Model model
			) {
		
		System.out.println(memberid + " : " + password);
		
		model.addAttribute("memberid", memberid);
		model.addAttribute("password", password);
		
		String reqid = request.getParameter("memberid");
		String reqpw = request.getParameter("password");
		
		System.out.println(reqid + " : " + reqpw);
		
		model.addAttribute("reqid", reqid);
		model.addAttribute("reqpw", reqpw);
		
		System.out.println(regRequest);
		
		
		return "member/reg";
	}

}
