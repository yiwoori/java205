<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER</title>
</head>
<body>

	<%-- ${orderCommand} --%>

	<h1>ORDER</h1>
	<hr>
		<table border="1">
		
		<c:forEach items="${orderCommand.orderItems}" var="item" varStatus="stat">
		<!-- 원본(orderCommand.orderItems)가져오고, 이름(item)지정 -->
		
			<tr>
				<td rowspan="3">ITEM-${stat.count}</td>
				<td>ID</td>
				<td>${item.itemId}</td>
			</tr>
			<tr>
				<td>QTY</td>
				<td>${item.number}</td>
			</tr>
			<tr>
				<td>REMARK</td>
				<td>${item.remark}</td>
			</tr>
			
			
			
			<tr>
				<td rowspan="3">ADDRESS</td>
				<td>ZIPCODE</td>
				<td>${orderCommand.address.zipcode}</td> <!-- getZipcode -->
			</tr>
			<tr>
				<td>ADDRESS1</td>
				<td>${orderCommand.address.address1}</td>
			</tr>
			<tr>
				<td>ADDRESS2</td>
				<td>${orderCommand.address.address2}</td>
			</tr>

		</c:forEach>
	</table>

</body>
</html>


<!-- 
	1. Controller : 사용자 요청 URL 등록 -> view 지정
	2. View 생성
  -->
