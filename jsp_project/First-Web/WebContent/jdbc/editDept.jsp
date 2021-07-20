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
	
	//데이터 베이스 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
		//jdbcurl
		/* String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		String user = "bit";
		String pw = "bit";
		 = static 메소드 ConnectionProvider로 해결
		*/
		
	conn = ConnectionProvider.getConnection();
	/* conn = DriverManager.getConnection(jdbcUrl, user, pw); */
	
	String sqlUpdate = "update dept set dname=?, loc=? where deptno=?";
	pstmt = conn.prepareStatement(sqlUpdate);
	pstmt.setString(1, dname);
	pstmt.setString(2, loc);
	pstmt.setInt(3, Integer.parseInt(deptno));

	resultCnt = pstmt.executeUpdate(); //데이터 가져오기
	
	
	
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