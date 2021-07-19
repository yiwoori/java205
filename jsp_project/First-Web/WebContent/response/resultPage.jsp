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
		String select = request.getParameter("select"); //selectPage의 <select> 받
		int selNum = Integer.parseInt(select); //문자열이 아닌 숫자를 가져올 경우
		
		if(selNum>0){
			out.println(selNum);
			
			//sendRedirect(경로) -> 현재 페이지가 응답처리 되고 난 후 경로의 페이지를 요청
			response.sendRedirect("result.jsp");
		} else {
			out.println(selNum);
			%>
			현재 페이지 : resultPage.jsp가 응답되는 것이 아니라 result.jsp 파일의 결과를 응답처리
			<!-- forward가 실행되는 순간 위의 응답처리는 모두 무시되고 forward 연결 페이지의 결과만을 응답처리 -->
			<jsp:forward page="result.jsp"/>
			<%
		}
	
	%>

</body>
</html>