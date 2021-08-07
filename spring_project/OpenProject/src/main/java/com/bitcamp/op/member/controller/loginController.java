package com.bitcamp.op.member.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.op.member.service.*;

@Controller
@RequestMapping("/member/login")
public class loginController {
	
	@Autowired
	private LoginService loginservice;

	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

}
