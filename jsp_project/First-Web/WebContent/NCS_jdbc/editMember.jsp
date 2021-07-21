<%@page import="java.sql.SQLException"%>
<%@page import="NCS_jdbc.Member"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="NCS_jdbc.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");
	
	String idx = request.getParameter("idx");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	Timestamp date = Timestamp.valueOf(LocalDateTime.now());
	
	int resultCnt = 0;
	
	Connection conn = null;
	MemberDao dao = null;
	
	try {
		
		conn = ConnectionProvider.getConnection();
		dao = MemberDao.getInstance();
		
		resultCnt = dao.updateMember(conn, new Member(Integer.parseInt(idx), id, pw, name, date));
		
	} catch(SQLException e) {
		e.printStackTrace();
	}
	
	if(resultCnt>0) {
		%>
		<script>
			alert('수정 완료');
			location.href = 'member_list.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href = 'member_list.jsp';
		</script>
		<%
	}

%>