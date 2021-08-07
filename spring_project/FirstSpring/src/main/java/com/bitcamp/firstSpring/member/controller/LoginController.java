package com.bitcamp.firstSpring.member.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.firstSpring.member.domain.*;

@Controller
@RequestMapping("/member/login")	// 브라우저에서 사용하는 URL.	(사용자가 http://localhost:8080/mvc/member/login을 요청하면 아래 메소드들을 실행)
public class LoginController {

	// @RequestMapping("/member/loginform")
	//@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginForm(
			
			//@RequestParam(value = "page", required = false) String page //true=404, int page일때 Null이면 500
			@RequestParam(value = "page", defaultValue = "1") int page 
			
			) {
		//System.out.println(page+1);
		System.out.println(page);
		return "member/loginForm"; // /WEB-INF/views/member/loginForm.jsp
	}

	//  /member/login/member/login
	//@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			HttpServletRequest request,
			@ModelAttribute("loginReq") LoginRequest loginrequest,
			Model model
			
			) {
		
		//사용자의 파라미터 데이터를 받는 방법
		// 1. HttpServletRequest 이용
		// 2. @RequestParam("param name") -> 한두개 받을 경우
		// 3. 커맨드 객체(Beans) 이용 -> 많은 내용을 받을 경우
				
		System.out.println(id + " : " + pw);
		
		// view에 전달할 데이터 저장 : Model 객체를 이용 (메소드가 String이고 view만 반환할 때, 매개변수로 Model을 넣어 사용
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
		
		System.out.println(uid + " : " + upw);
		
		model.addAttribute("uid", uid);
		model.addAttribute("upw", upw);
		
		System.out.println(loginrequest);
		
		//세션 속성에 loginInfo 등록
		request.getSession(false).setAttribute("loginInfo", new LoginInfo());
		
		return "member/login"; // /WEB-INF/views/member/login.jsp
	}

}