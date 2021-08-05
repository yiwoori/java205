<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER FORM</title>
</head>
<body>

	<h1>ORDER</h1>
	<hr>
	<form method="post">
		<table border="1">
		
			<tr>
				<td rowspan="3">ITEM-1</td>
				<td>ID</td>
				<td><input type="text" name="orderItems[0].itemId"></td>	<!-- 첫번째 아이템으로 생성 -->
			</tr>
			<tr>
				<td>QTY</td>
				<td><input type="number" name="orderItems[0].number"></td>
			</tr>
			<tr>
				<td>REMARK</td>
				<td><input type="text" name="orderItems[0].remark"></td>
			</tr>
			
			<tr>
				<td rowspan="3">ITEM-2</td>
				<td>ID</td>
				<td><input type="text" name="orderItems[1].itemId"></td>	<!-- 두번째 아이템으로 생성 -->
			</tr>
			<tr>
				<td>QTY</td>
				<td><input type="number" name="orderItems[1].number"></td>
			</tr>
			<tr>
				<td>REMARK</td>
				<td><input type="text" name="orderItems[1].remark"></td>
			</tr>
			
			<tr>
				<td rowspan="3">ITEM-3</td>
				<td>ID</td>
				<td><input type="text" name="orderItems[2].itemId"></td>	<!-- 세번째 아이템으로 생성 -->
			</tr>
			<tr>
				<td>QTY</td>
				<td><input type="number" name="orderItems[2].number"></td>
			</tr>
			<tr>
				<td>REMARK</td>
				<td><input type="text" name="orderItems[2].remark"></td>
			</tr>
			
			<tr>
				<td rowspan="3">ITEM-4</td>
				<td>ID</td>
				<td><input type="text" name="orderItems[3].itemId"></td>	<!-- 네번째 아이템으로 생성 -->
			</tr>
			<tr>
				<td>QTY</td>
				<td><input type="number" name="orderItems[3].number"></td>
			</tr>
			<tr>
				<td>REMARK</td>
				<td><input type="text" name="orderItems[3].remark"></td>
			</tr>
			
			<tr>
				<td rowspan="3">ADDRESS</td>
				<td>ZIPCODE</td>
				<td><input type="text" name="address.zipcode"></td>
			</tr>
			<tr>
				<td>ADDRESS1</td>
				<td><input type="text" name="address.address1"></td>
			</tr>
			<tr>
				<td>ADDRESS2</td>
				<td><input type="text" name="address.address2"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit"></td>
				<td></td>
			</tr>
		</table>
	</form>

</body>
</html>


<!-- 
	1. Controller : 사용자 요청 URL 등록 -> view 지정
	2. View 생성
  -->
