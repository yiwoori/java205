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


	<h1>쿠키가 정보를 확인합니다.</h1>
	
	<h3>username=${userName}</h3>
	
	<a href="<c:url value='/'/>">홈으로 가기</a> <br>
	<a href="view">쿠키 정보 보기</a>

</body>
</html>