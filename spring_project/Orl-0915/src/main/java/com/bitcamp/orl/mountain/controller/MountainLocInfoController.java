package com.bitcamp.orl.mountain.controller;


import com.bitcamp.orl.mountain.service.MountainLocInfoViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MountainLocInfoController {

	@Autowired
	MountainLocInfoViewService service;

	//  Get방식으로 들어왔을 때 전국지도로 return
	@RequestMapping(value ="/mountain/mountainLocInfo",method = RequestMethod.GET)
	public String getMountainLocGet() {

		return "mountain/mountain_all";
	}

	// Post방식으로 들어왔을 때 지역별 산 리스트 페이지로 이동
	@RequestMapping(value ="/mountain/mountainLocInfo",method = RequestMethod.POST)
	public String getMountainLocPost(HttpServletRequest request, Model model) {

		String loc = null;
		loc = request.getParameter("locName");
		int countLoc = service.getCountLoc(loc);
		String locEn = service.getLocEn(loc);

		model.addAttribute("loc", loc);
		model.addAttribute("countLoc", countLoc);
		model.addAttribute("locEn", locEn);
		return "mountain/local";
	}

}
