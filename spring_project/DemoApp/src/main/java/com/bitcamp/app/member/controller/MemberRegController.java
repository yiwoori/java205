package com.bitcamp.app.member.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.app.member.domain.*;
import com.bitcamp.app.member.service.*;

@Controller
@RequestMapping("/member/memberReg")
public class MemberRegController {
	
	@Autowired
	private MemberRegService regService;

	@RequestMapping(method = RequestMethod.GET)
	public String regForm() {
		return "member/regForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String reg(
			@ModelAttribute("regRequest") MemberRegRequest regRequest,
			HttpServletRequest request,
			Model model
			) {
		//System.out.println(regRequest);
		
		int result = regService.memberReg(regRequest, request);
		
		model.addAttribute("result", result);
		
		String view = "member/reg" ;
		if(result == 1) {
			// index로 redirect
			view = "redirect:/index";
		}
		return view;
	}
	
}