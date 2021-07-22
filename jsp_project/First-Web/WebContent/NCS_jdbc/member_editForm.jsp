<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="ncs.jdbc.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	String idx = request.getParameter("idx");

	Connection conn = null;
	MemberDao dao = null;
	
	try {
		conn = ConnectionProvider.getConnection();
		dao = MemberDao.getInstance();
		
		request.setAttribute("idx", dao.selectByIdx(conn, Integer.parseInt(idx)));
		
	} catch(SQLException e) {
		e.printStackTrace();
	}

%>

<jsp:forward page="form_view.jsp"></jsp:forward>