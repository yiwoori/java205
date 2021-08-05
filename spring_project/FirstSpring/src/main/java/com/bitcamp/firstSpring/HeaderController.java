package com.bitcamp.firstSpring;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class HeaderController {
	
	@RequestMapping("/header/header")
	public String getHeader(
		
			@RequestHeader("referer") String ref,
			Model model
			
			) {
		
		System.out.println(ref);
		model.addAttribute("re", ref);
		
		return "header/headerInfo";	//view
		//return "redirect:"+ref;
		//return "redirect:/member/login";
	}

}
