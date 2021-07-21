<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
</style>
<script>
</script>
</head>
<body>

	<h2>회원 가입</h2>
	<button onclick="location.href='member_list.jsp';">회원 목록</button>
	<hr>
	
	<form action="inputMember.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required></td>
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