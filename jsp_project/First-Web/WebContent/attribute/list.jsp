<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!-- list 요청이 들어온 경우 -->
<%
	/* 핵심처리 */
	String[] list = {"손흥민", "이강인", "황의조"};

	/* view 페이지에 선수 리스트(결과)를 공유 */
	request.setAttribute("players", list);

%>

<jsp:forward page="list_view.jsp"/>