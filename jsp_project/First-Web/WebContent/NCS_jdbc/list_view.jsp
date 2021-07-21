<%@page import="NCS_jdbc.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	List<Member> list = (List<Member>)request.getAttribute("result");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<style>
	td {
		text-align : center;
		padding : 5px 20px;
	}
</style>
<script>
</script>
</head>
<body>

	<h2>회원 목록</h2>
	<hr>
	<button onclick="location.href='inputForm.jsp'">회원등록</button>
	<hr>
		
	<table border=1>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		
		<%
			if(list!=null){
				for(int i=0; i<list.size(); i++) {
		%>
		
		<tr>
			<td><%= list.get(i).getIdx() %></td>
			<td><%= list.get(i).getId() %></td>
			<td><%= list.get(i).getPw() %></td>
			<td><%= list.get(i).getName() %></td>
			<td><%= list.get(i).getDate() %></td>
			<td>
				<a href="member_editForm.jsp?idx=<%=list.get(i).getIdx()%>">수정</a>
				<a href="javascript:delMember(<%=list.get(i).getIdx()%>)">삭제</a>
			</td>
		</tr>
				<%
				}
			}
		%>
		
	</table>
	
	<script>
	function delMember(idx) {
		if(confirm('정말 삭제하시겠습니까?')) {
			location.href = 'member_delete.jsp?idx='+idx;
		}
	}
	</script>

</body>
</html>