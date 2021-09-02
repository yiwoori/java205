package com.bitcamp.app.member.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.app.member.domain.*;
import com.bitcamp.app.member.service.*;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService listService ;
	
	@RequestMapping("/member/list")
	public String getList(
			SearchType searchType,
			Model model
			) {
		
		System.out.println(searchType);
		
		List<Member> list = null;
		
		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
			list = listService.getMemberList(searchType);
			System.out.println(1);
		} else {
			list = listService.getMemberList();
		}
		
		model.addAttribute("memberList", list);
		return "member/list";
	}
	
}