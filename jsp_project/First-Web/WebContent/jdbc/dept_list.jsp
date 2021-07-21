<%@page import="jdbc.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

//dept_list.jsp -> 요청을 받고 '처리' -> 결과 데이터를 객체 속성에 저장 -> view에 저장

	//1. 드라이버 로드 -> 서블릿 등록(jdbc.util.Loader)
	
	//2. DB연결
	Connection conn = null; /* 초기화 */
	DeptDao dao = DeptDao.getInstance();
	
	try {
		conn = ConnectionProvider.getConnection();
		 
		//6. 결과 데이터 request 속성에 저장 -> 데이터 공유(전달)
		/* request.setAttribute("result", deptList); */
		request.setAttribute("result", dao.getDeptList(conn));		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn);
	}
	
%>

	<!-- 리스트 객체 전달 -->
	<jsp:forward page="list_view.jsp"/> <!-- 뷰의 역할만 -->
	

	