package com.bitcamp.firstSpring;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index() {
		return "index";	//	/WEB-INF/views/index.jsp
	}

}
