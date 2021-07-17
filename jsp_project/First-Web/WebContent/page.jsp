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
	<!-- header -> include -->
	<%@ include file="include/header.jsp" %>
	<%--@ include file="WEB-INF/header.jsp" --%>
	<!--WEB-INF 폴더는 프로그램 외부에서 접근 불가-->
	
	<!-- nav -> include -->
	<%@ include file="include/nav.jsp" %>
	
	<div id="wrap">
	<!-- wrap -> include -->
	<%@ include file="include/news.jsp" %>
	<!-- shopping -> include -->
	<%@ include file="include/shopping.jsp" %>
	</div>
	
	<!-- jsp:include는 아래 parameter를 통해 데이터 전송 -->
	<!-- jsp:include = 실행된 jsp->html(text) 결과를 가져온다. -->
	<jsp:include page="footer.jsp"/>
		<jsp:param name="email" value="test@gmail.com"/>
		<jsp:param name="tel" value="010-0000-0000"/>
	</jsp:include>


</body>
</html>