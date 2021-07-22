<%@page import="ncs.jdbc.Member"%>
<%@page import="ncs.jdbc.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	Member member = (Member)request.getAttribute("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<style>
</style>
<script>
</script>
</head>
<body>

	<h2>회원 정보 수정</h2>
	<hr>
	
	<form action="editMember.jsp" method="post">
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="number" name="idx" value="<%= member.getIdx() %>" readonly></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%= member.getId() %>" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" value="<%= member.getPw() %>" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= member.getName() %>" required></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="등록">
					<input type="reset">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>