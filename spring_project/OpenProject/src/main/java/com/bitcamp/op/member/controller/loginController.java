package com.bitcamp.op.member.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.op.member.service.*;

@Controller
@RequestMapping("/member/login")
public class loginController {
	
	@Autowired
	private LoginService loginservice;

	@RequestMapping(method = RequestMethod.GET)
	public String loginForm(
			@RequestHeader(value = "referer", required = false) String redirectUri,
			Model model
			) {
		model.addAttribute("redirectUri", redirectUri);
		return "member/loginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			@RequestParam("memberid") String memberid,
			@RequestParam("password") String password,
			@RequestParam(value = "redirectUri", required = false) String redirectUri,
			@RequestParam(value="reid", required = false) String reid,			//매개변수 3개 이상 -> 객체로(따로 클래스 생성)
			HttpSession session,
			HttpServletResponse response,
			Model model
			) {
		
		
		//사용자가 입력한 id, pw를 서비스에 전달해서 로그인 처리
		boolean loginChk = loginservice.login(memberid, password, reid, session, response);
		model.addAttribute("loginChk", loginChk);
		
		String view = "member/login";
		
		if(redirectUri!=null && loginChk) {
			view = "redirect:"+redirectUri;
		}
		
		return view;
	}

}
