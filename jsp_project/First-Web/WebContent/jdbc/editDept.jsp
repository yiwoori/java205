<%@page import="dept.domain.Dept"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%

	//1. 사용자가 입력한 데이터를 받고
	
	//***입력 데이터의 한글처리***
	request.setCharacterEncoding("utf-8");
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	int resultCnt = 0;
	
	//2. DB처리 : insert
	//데이터 베이스 드라이버 로드 -> 서블릿 등록(jdbc.util.Loader)
	
	Connection conn = null;
	DeptDao dao = null;
	
	try {
		
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
		
		resultCnt = dao.updateDept(conn, new Dept(Integer.parseInt(deptno), dname, loc));
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	//실행결과에 맞는 응답
	if(resultCnt>0) {
		%>
		<script>
			alert('수정완료');
			location.href = 'dept_list.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href = 'dept_list.jsp';
		</script>
		<%
	}

%>