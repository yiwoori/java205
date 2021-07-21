<%@page import="dept.domain.Dept"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	//1. 사용자가 입력한 데이터를 받고 -> 처리 -> 결과를 속성에 저장 -> view에 저
	
	//***입력 데이터의 한글처리***
	request.setCharacterEncoding("utf-8");
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	int resultCnt = 0;
	
	//2. DB처리 : insert
	//데이터 베이스 드라이버 로드 -> 서블릿 등록(jdbc.util.Loader)
	//연결
	Connection conn = null; /* 초기화 */
	DeptDao dao = DeptDao.getInstance();
	
	try {

		conn = ConnectionProvider.getConnection();
		resultCnt = dao.insertDept(conn, new Dept(Integer.parseInt(deptno), dname, loc));
	
	} catch (Exception e) {
		
	}
	  //3-2.javascript
	  	if(resultCnt>0) {
	  		%>
	  		<script>
	  			alert('등록 완료');
	  			location.href = 'dept_list.jsp';
	  		</script>
	  		<%
	  	} else {
	  		%>
	  		<script>
	  			alert('오류 발생\n(입력페이지 이동)');
	  			location.href = 'dept_regForm.jsp';
	  		</script>
	  		<%
	  	}


%>