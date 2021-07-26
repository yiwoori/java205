<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	session.setAttribute("userName", request.getParameter("id"));
	response.sendRedirect(request.getContextPath()+"/member/mypage/mypage.jsp"); //로그인->마이페이지로 이동되도록

%>