<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
	
	//연결
	Connection conn = null; /* 초기화 */
	PreparedStatement pstmt = null; /* sql statement import */
	
	try {
			//jdbcurl
		/* String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		String user = "bit";
		String pw = "bit";
		 = static 메소드 ConnectionProvider로 해결
		*/

		conn = ConnectionProvider.getConnection();
	/* conn = DriverManager.getConnection(jdbcUrl, user, pw); */
	
	//preparedStatement
	String sqlInsert = "insert into dept values(?,?,?)";
	pstmt = conn.prepareStatement(sqlInsert);
	pstmt.setInt(1, Integer.parseInt(deptno));
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	
	resultCnt = pstmt.executeUpdate(); //데이터 가져오기
	
	out.println(resultCnt);
	
	//insert -> 결과는 int
	
	
	
	//3. dept_list.jsp 이동
	  //3-1.sendRedirect
		//response.sendRedirect("dept_list.jsp"); //처리후 다른 페이지로 바로 이동
	} catch (Exception e) {
		
	}
	  //3-2.javascript
	  	if(resultCnt>0) {
	  		%>
	  		<script>
	  			alert('등록 완료');
	  			location.href = 'dept_list.jsp'
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