package com.bitcamp.firstSpring.member.intercepter;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class AuthCheckIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		
		System.out.println("AuthCheckIntercepter preHandle() 진입");
		
		// 1. 로그인 여부 확인
		// 2. 로그인 상태에 따라 true(해당 controller 실행) / false(controller 실행x)로 return
		// 3. 로그인 상태가 아니라면 로그인 페이지로 redirect
		
		// 로그인 상태 확인
		HttpSession session = request.getSession(false);
		
		if(session!=null && session.getAttribute("loginInfo")!=null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
		
	}

}
