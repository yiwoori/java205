<%@page import="jdbc.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="ncs.jdbc.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	String idx = request.getParameter("idx");

	int resultCnt = 0;
	
	Connection conn = null;
	MemberDao dao = MemberDao.getInstance();
	
	try {
		
		conn = ConnectionProvider.getConnection();
		resultCnt = dao.deleteMember(conn, Integer.parseInt(idx));
		
	} catch(SQLException e) {
		e.printStackTrace();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn);
	}
	
	
	
	if(resultCnt>0) {
		%>
		<script>
			alert('삭제완료');
			location.href="member_list.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href="member_list.jsp";
		</script>
		<%
	}

%>