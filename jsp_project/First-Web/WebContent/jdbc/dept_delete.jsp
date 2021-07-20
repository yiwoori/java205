<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	//사용자가 전달하는 deptno를 받고
	String deptno = request.getParameter("deptno");
	
	//DB의 데이터 삭제
	int resultCnt = 0;
	
	//DB처리 : delete
	
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
	
	String sqlDelete = "delete from dept where deptno=?";
	pstmt = conn.prepareStatement(sqlDelete);
	pstmt.setInt(1, Integer.parseInt(deptno));
	
	resultCnt = pstmt.executeUpdate(); //데이터 가져오기
	
	
	
	//실행결과에 맞는 응답
	if(resultCnt>0) {
		%>
		<script>
			alert('삭제완료');
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