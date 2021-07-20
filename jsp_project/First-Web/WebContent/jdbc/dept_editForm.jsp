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
	
	

	//전달받은 부서번호로 부서정보 가져오기
		//1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
			
		//2. DB연결
		Connection conn = null; /* 초기화 */
		PreparedStatement pstmt = null; /* sql statement import */
		ResultSet rs = null; /* sql ResultSet import */
		
			//jdbcurl
			/* String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
			String user = "bit";
			String pw = "bit";
			 = static 메소드 ConnectionProvider로 해결
			*/
		
			conn = ConnectionProvider.getConnection();
		/* conn = DriverManager.getConnection(jdbcUrl, user, pw); */
			
		
		Dept dept = null;
		
		String sqlSelect = "select * from dept where deptno=?";
		pstmt = conn.prepareStatement(sqlSelect);
		pstmt.setInt(1, Integer.parseInt(deptno));
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dept = new Dept();
			dept.setDeptno(rs.getInt("deptno"));
			dept.setDname(rs.getString("dname"));
			dept.setLoc(rs.getString("loc"));
		}
		

		
	//부서정보를 form_view.jsp로 전달(공유)
		request.setAttribute("dept", dept);
	
	
	
%>

<jsp:forward page="form_view.jsp"></jsp:forward>





