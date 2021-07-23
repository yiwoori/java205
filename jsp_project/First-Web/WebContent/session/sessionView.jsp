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

	<%
	//로그인 후 사용자(회원)의 이름은 세션 속성에 저장
		String userName=(String)session.getAttribute("userName");
		//getAttribute는 오브젝트를 반환 -> String으로 형변환 필요 (session.jsp의 "손흥민"이 문자열)
		
		if(userName==null) {
			out.println("로그인 상태 아님");
			out.println("<script>alert('로그인이 필요한 페이지입니다.');</script>");
		}
	%>
	
	<h1>세션의 속성에 저장된 userName : <%=session.getAttribute("userName") %></h1>
	<h3><a href="logout.jsp">로그아웃</a></h3>

</body>
</html>