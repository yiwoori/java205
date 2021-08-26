package com.bitcamp.app;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {
	
	@RequestMapping("/member")
	public String page() {
		return "member";
	}

}
