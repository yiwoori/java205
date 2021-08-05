package com.bitcamp.firstSpring;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.*;

@Controller
public class CookieController {
	
	// 쿠키 생성해주는 요청 처리
	@RequestMapping(value = "/cookie/make")
	public String makeCoockie(HttpServletResponse response) {
		
		Cookie c = new Cookie("username", "KING");
		response.addCookie(c);	//사용자에게 쿠키 전송
		
		//service.process(response)
		
		return "cookie/make";
	}
	
	//@RequestMapping(value="/cookie/view")
	@RequestMapping("/cookie/view")
	public String viewCookie(
			
			//@CookieValue("username", required = false) String userName,
			@CookieValue(value="usernames", defaultValue="SCOTT") String userName,
			Model model
			
			) {
	
		model.addAttribute("userName", userName);
		System.out.println(userName);
		
		//..Cookie 정보를 이용해 데이터 처리
		
		
		return "cookie/view";
	}

	
}
