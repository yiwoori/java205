package com.bitcamp.firstSpring;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ExceptionController {
	
	private String str;
	
	@RequestMapping("/error/error")
	public String getPage() {
		
		//str="String";
		
		System.out.println(str.charAt(0)); //(비정상적 주입) nullpointEx 발생시킴
		
		return "index";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(NullPointerException e) {
		e.printStackTrace();
		return "error/nullPointer";
	}

}
