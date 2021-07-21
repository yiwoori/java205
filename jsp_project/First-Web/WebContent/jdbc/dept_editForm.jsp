<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	//사용자가 전달하는 부서번호 받기
	String deptno = request.getParameter("deptno");
	
	

	//전달받은 부서번호로 부서정보 가져오기 -> 처리 -> Dept데이터 공유
	//1. 드라이버 로드 -> 서블릿 등록(jdbc.util.Loader)
	//2. DB연결
	Connection conn = null; /* 초기화 */
	DeptDao dao = null;
	
	try {
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
		
		//부서정보를 form_view.jsp로 전달(공유)
		request.setAttribute("dept", dao.selectByDeptno(conn, Integer.parseInt(deptno)));
		
	} catch(SQLException e) {
		e.printStackTrace();
	}
		
		
	
	
%>

<jsp:forward page="form_view.jsp"></jsp:forward>





