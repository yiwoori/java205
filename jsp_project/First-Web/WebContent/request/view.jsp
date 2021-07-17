<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- request_result.jsp에서 전달받은 데이터 -->
<h3><%= request.getAttribute("userName") %></h3>
<h3><%= request.getAttribute("job") %></h3>
<h3><%= request.getAttribute("age") %></h3>