package com.bitcamp.orl;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String getIndexPage() {
		return "redirect:/index";
	}

	@RequestMapping("/index")
	public void getIndex() {
	}
}