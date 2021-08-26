package com.bitcamp.op.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.op.member.domain.Member;
import com.bitcamp.op.member.domain.MemberRegRequest;
import com.bitcamp.op.member.service.MemberRegService;
import com.bitcamp.op.member.service.MemberRestService;

//@Controller
@RestController
public class MemberRestController {
	
	@Autowired
	private MemberRestService restService;
	
	@Autowired
	private MemberRegService regService;
	
	@RequestMapping("/members/{id}")
	@CrossOrigin
	//@ResponseBody		: @controller가 아닌 @RestController시 생략 가능
	public Member getMember(
			@PathVariable("id") int idx
			) {
		Member member = restService.getMember(idx);
		System.out.println(member);
		return member;
	}
	
	@GetMapping("/members")
	@CrossOrigin
	public List<Member> getMembers(){
		return restService.getMembers();
	}
	
	@GetMapping("/members1")
	public Map<Integer, Member> getMembers1(){
		
		return restService.getMembers1();
	}
	
	@PostMapping("/members/reg1")
	@CrossOrigin
	public String regMember1(
			MemberRegRequest regRequest,
			HttpServletRequest request
			) {
		System.out.println(regRequest);
		return Integer.toString(regService.memberReg(regRequest, request));
	}
	
	@PostMapping("/members/reg2")
	@CrossOrigin
	public String regMember2(
			@RequestBody MemberRegRequest regRequest,
			HttpServletRequest request
			) {
		System.out.println(regRequest);
		return Integer.toString(regService.memberReg(regRequest, request));
	}
	
}
