<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "손흥민");	/* 속성 저장 */
	session.setAttribute("name", "이강인");
	application.setAttribute("name", "메시");
	
	Member member = new Member();
	member.setId("cool");
	member.setName("COOL");
	member.setPw("1234");
	session.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	표현식 : <%= request.getAttribute("name") %> <br>
	
	표현언어1 : ${requestScope.name} <br>
	<br>
	
	내장객체의 표현식이 생략되었을 때의 규칙 <br>
	1. pageScope의 속성을 찾는다
	 -> 2. requestScope
	 -> 3. sessionScope
	 -> 4.Application 속성 순으로 찾는다 <br><br>
	<!-- 중간에 한 속성에서 속성이름을 찾으면 뒤로 더이상 진행하지 않는다 -->
	 
	표현언어2 : ${name} <br><br>
	표현언어3 : ${sessionScope.name} <br>
	표현언어4 : ${applicationScope.name} <br>
	
	
	
	<br><br><hr><br><br>
	
	
	
	표현식 param.code : <%= request.getParameter("code") %> <br> <!-- null 출력 -->
	표현언어 param.code : ${param.code} <br> <!-- 공백 출력 -->
	<!-- 데이터가 없을때 표현식은 null을 출력, 표현언어는 공백을 출력한다 -->
	
	
	
	<br><br><hr><br><br>
	
	
	
	<!-- 패스경로 출력 -->
	
	표현식 pageContext : <br>
		<%= pageContext.getRequest().getServletContext().getContextPath() %> <br>
		<%= request.getContextPath() %><br>
		
	<br>
	
	표현언어 pageContext : <br>
		URL : ${pageContext.request.requestURL}<br>
		URI : ${pageContext.request.requestURI}<br>
		경로 : ${pageContext.request.contextPath}<br>
	
	
	
	<br><br><hr><br><br>



	${true} / ${false} / ${100} / ${'손흥민'} / ${null} <!-- null:공백출력 -->



	<br><br><hr><br><br>

	<!-- 					= member.getId() -->
	표현언어 : ${member} / ${member.id} <br>
	표현식 : <%= session.getAttribute("member") %>
	 / <%= ((Member) session.getAttribute("member")).getId() %> <br>






</body>
</html>