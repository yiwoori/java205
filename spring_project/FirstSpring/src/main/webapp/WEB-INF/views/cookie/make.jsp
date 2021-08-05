<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<!-- http://localhost:8080/mvc/cookie/make -->
		<%-- 	<c:url value='/'/>  --%>
	<h1>쿠키가 생성되었습니다.</h1>	<!-- F12->Application->cookie에서 확인 가능 -->
	
	<a href="<c:url value='/'/>">홈으로 가기</a> <br>
	<a href="view">쿠키 정보 보기</a>

</body>
</html>