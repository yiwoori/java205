<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<!-- 에러 발생시 보여지는 페이지로 지정 -->

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

	<h1>NullPointerException 에러가 발생했습니다.<br>
		메인 페이지로 이동해주세요.</h1>
	<h3>
		<%= exception.getMessage() %> <br>
		<%= exception.getClass().getName().equals("java.lang.ArithmeticException") %>
	</h3>

</body>
</html>