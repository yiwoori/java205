<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루 생성중</title>
</head>
<body>
	<c:if test="${crew.crewIdx ne null}">
		<script>
			alert('크루 생성이 완료되었습니다.');
			window.location.href="<c:url value='/crew/detail/"+${crew.crewIdx}+"&1'/>"
		</script>
	</c:if>
</body>
</html>