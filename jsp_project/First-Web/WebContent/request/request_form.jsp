<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<h1>request Form Test</h1>
	<hr>
	<!-- 데이터를 처리할 위치로 전송 : !!!input 요소에 name 속성 반드시 정의!!! -->
	<!-- <form action="request_result.jsp" type="get"> post를 더 사용 -->
	<form action="request_result.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job">
 						<option>시스템 엔지니어</option>
						<option>자바 프로그래머</option>
						<option>그래픽 디자이너</option>

					</select>
				</td>
			</tr>
			<tr>
				<td>관심사항</td>
				<td>
					<input type="checkbox" name="interest" value="java"> java
					<input type="checkbox" name="interest" value="css3"> css3
					<input type="checkbox" name="interest" value="javascript"> javascript
					<input type="checkbox" name="interest" value="JSP"> JSP
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit">
					<input type="reset"></td>
			</tr>
		</table>
	</form>







</body>
</html>