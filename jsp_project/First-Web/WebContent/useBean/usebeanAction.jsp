<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="member.Member" scope="session"/>

<!-- 
	1. request 속성에 member라는 속성을 찾는다
	2. member가 member.Member 타입의 객체인지 확인한다
	3.1 있다면 : request.getAttribute("member");로 가져와서 사용할 수 있도록 한다
	3.2 없다면 : new member.Member() -> request.setAttribute("member", new member.Member());
 -->

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

	<%= member %>
	<br>
	<%= member.getName() %>

</body>
</html>