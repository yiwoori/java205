<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	//요청을 받고 '처리하는 과정' ->dept_list.jsp

	//jsp로 처리하는 과정
	//1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	
	
	//2. DB연결
	Connection conn = null; /* 초기화 */
	Statement stmt = null; /* sql statement import */
	ResultSet rs = null; /* sql ResultSet import */
	
		//jdbcurl
		/* String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		String user = "bit";
		String pw = "bit";
		 = static 메소드 ConnectionProvider로 해결
		*/
		conn = ConnectionProvider.getConnection();
	
	
	
	//3. Statement
	stmt = conn.createStatement();
	
	//sql
	String sqlSelect = "select * from dept";
	
	
	
	//4. ResultSet
	rs = stmt.executeQuery(sqlSelect);
	
	
	
	//5. list<Dept>생성 -> 원하는 결과
	List<Dept> deptList = new ArrayList<Dept>();
	
	while(rs.next()) {
		//List에 객체 추가
		deptList.add(new Dept(
							rs.getInt("deptno"),
							rs.getString("dname"),
							rs.getString("loc")
							)
				);
	}
	out.println(deptList);
	
	
	
	//6. 결과 데이터 request 속성에 저장 -> 데이터 공유(전달)
	request.setAttribute("result", deptList);
	
	
%>



	<!-- 리스트 객체 전달 -->
	<jsp:forward page="list_view.jsp"/> <!-- 뷰의 역할만 -->
	
	
	