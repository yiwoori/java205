<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	session.invalidate(); //현재 세션 객체 소멸 -> 세션에 저장된 속성들도 함께 소멸 = 회원정보도 소멸
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>

	<h1>로그아웃 되었습니다.</h1>
	<h3><a href="sessionView.jsp">세션정보 확인</a></h3>

</body>
</html>