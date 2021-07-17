<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WR Blog</title>

<link rel="stylesheet" href="/First-Web/blog/myblog.css">
<!-- /First-Web/blog/myblog.css = 절대경로(포트 뒤쪽으로 오는 경로) -->
</head>
<body>

	<div id="main_wrap">

		<!-- header 시작 -->
		<%@ include file="blog_header.jsp" %>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@ include file="blog_nav.jsp" %>
		<!-- nav 끝 -->

		<!-- 컨텐츠 시작 -->
		<div id="content_wrap">
		<%@ include file="blog_section.jsp" %>
		<%@ include file="blog_aside.jsp" %>
		</div>
		<!-- 컨텐츠 끝 -->

		<!-- footer 시작 -->
		<%@ include file="blog_footer.jsp" %>
		<!-- footer 끝 -->

	</div>

</body>
</html>