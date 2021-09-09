package com.bitcamp.orl.member.service;

import java.io.*;

import javax.servlet.http.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.orl.member.dao.*;
import com.bitcamp.orl.member.domain.*;
import com.bitcamp.orl.member.util.*;

@Service
public class LoginService {

	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;

	boolean loginChk = false;

	public boolean login(HttpServletRequest request, HttpServletResponse response, String memberId, String memberPw,
			String reid) {

		cookieChk(response, reid, memberId);

		dao = template.getMapper(Dao.class);

		if (memberId != null && memberPw != null && memberId.trim().length() > 2 && memberPw.trim().length() > 2) {
			Member member = dao.selectByIdPw(memberId, memberPw);
			if (member != null) {
				MemberVo memberVo = member.memberToMemberVo();
				request.getSession().setAttribute("memberVo", memberVo);
				loginChk = true;
			}
		}
		return loginChk;
	}

	public void cookieChk(HttpServletResponse response, String reid, String id) {

		if (reid != null && reid.equals("on")) {
			// 쿠키 저장: 사용자 ID를 저장(1년)
			try {
				response.addCookie(CookieBox.createCookie("reid", id, "/", 60 * 60 * 24 * 365));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			// 쿠키값을 저장하지 않는다
			try {
				response.addCookie(CookieBox.createCookie("reid", id, "/", 0));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean chkURI(String uri) {
		boolean chk = true;

		if (!uri.startsWith("/orl/member/login")) {
			chk = false;
		}
		return chk;
	}
}