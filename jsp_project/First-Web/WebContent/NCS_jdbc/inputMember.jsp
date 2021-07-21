<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="NCS_jdbc.Member"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="NCS_jdbc.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	Timestamp date = Timestamp.valueOf(LocalDateTime.now());

	int resultCnt = 0;

	Connection conn = null;
	MemberDao dao = MemberDao.getInstance();
	
	try {
		
		conn = ConnectionProvider.getConnection();
		resultCnt = dao.insertMember(conn, new Member(0, id, pw, name, date));
		
	} catch(Exception e) {
		
	}

	if(resultCnt>0) {
		%>
		<script>
			alert('등록 완료');
			location.href = 'member_list.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('등록 오류 발생/n(입력 페이지로 이동합니다)')
			location.href = 'inputForm.jsp';
		</script>
		<%
	}

%>