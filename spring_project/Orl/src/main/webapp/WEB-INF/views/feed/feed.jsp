<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FEED</title>
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/feed/feedmain.css'/>">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<!-- backgorund START -->
	<div>
		<div class="feedmain">
		
			<!-- top blank START -->
			<div class="top">
				<div></div>
				<div class="h1box">
					<div>
						<h1>FEED</h1>
					</div>
				</div>
				<div></div>
			</div>
			<!-- top blank END -->
			
			
			
			<!-- main START -->
			<div class="main">
				<!-- left blank -->
				<div class="leftbox"></div>
				
				<!-- main box START -->
				<div class="mainbox">

					<!-- mountain icon -->
					<div class="mountain">
						<img src="<c:url value="/images/feed/feedw/mountain.png"/>">
					</div>

					<!-- feed nav START -->
					<div class="feednav">
						<div class="keyword">
							<!-- 기본 정렬 (최신순) -->
							<a class="newFeed" onclik="showNewFeed()">최신</a>
							<!-- 선택 정렬 (인기순) -->
							<a href="#">인기</a>
						</div>
						
						

						<!-- feed create button (Login status) -->
						<c:if test="${sessionScope.memberVo ne null}">
							<div class="div_createfeed">
								<div>
									<button class="modalbtn_createfeed">피드 올리기</button>
								</div>
							</div>
						</c:if>

						<!-- feed search -->
						<form>
							<div class="search">
								<input type="text" placeholder="search">
								<button type="submit">
									<img src="<c:url value="/images/feed/feedw/search.png"/>"
										alt="search">
								</button>
							</div>
						</form>

					</div>
					<!-- feed nav END -->

					<!-- feed Gallery START -->
					<div id="fBox" class="feedbox">

						<%-- <c:forEach var="selectNewFeed" items="${selectNewFeed}">
							<div class="feed">
							
								<!-- feed photo START -->
								<div class="feedsize">
									<button class="modalbtn_feedview" type="button" onclick="feedLoginCheck(${selectNewFeed.memberIdx}, ${selectNewFeed.boardIdx})">
										<img src="<c:url value="/images/feed/feedw/uploadfile/${selectNewFeed.boardPhoto}"/>" class="feedimg" alt="feedimg">
									</button>
								</div>
								<!-- feed photo END -->
								
								<!-- feed info START -->
								<div class="feedinfo">
								
									<!-- creator nickname -->
									<div class="nickname">
										<a href="<c:url value="/feed/userFeed/${selectNewFeed.memberIdx}"/>" class="nickname2">${selectNewFeed.memberNickname}</a>
										<a onclick="feedNicknameCheck(${selectNewFeed.memberIdx})" class="nickname2">${selectNewFeed.memberNickname}</a>
									</div>
									
									<!-- like button -->
									<div>
										<button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
									</div>
									
								</div>
								<!-- feed info END -->
								
							</div>
						</c:forEach> --%>

					</div>
					<!-- feed Gallery END -->

				</div>
				<!-- main box END -->
				
				<div class="rightbox"></div>
				<!-- right blank -->
				
			</div>
			<!-- main END -->
			
			<!-- bottom blank -->
			<div class="bottom"></div>
			
		</div>
	</div>
	<!-- background END -->
	


<script>
/* NEW feed list */
function showNewFeed(list){
	
	var html = '';
	console.log('show new feed');
	
	$.each(list, function(index, item){
		
		html += '<div class="feed">';
		html += '	<div class="feedsize">';
		html += '		<button class="modalbtn_feedview" type="button" onclick="feedLoginCheck('+item.memberIdx+', '+item.boardIdx+')">';
		html += '			<img src="<c:url value="/images/feed/feedw/uploadfile/'+item.boardPhoto+'"/>" class="feedimg" alt="feedimg">';
		html += '		</button>';
		html += '	</div>';
		html += '	<div class="feedinfo">';
		html += '		<div class="nickname">';
		html += '			<a onclick="feedNicknameCheck('+item.memberIdx+')" class="nickname2">'+item.memberNickname+'</a>';
		html += '		</div>';
		html += '		<div>';
		html += '			<button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>';
		html += '		</div>';
		html += '	</div>';
		html += '</div>';
	
	})
	
	$('#fBox').html(html);
	
	
}
$(document).ready(function(){
	
	/* NEW feed list ajax */
	$.ajax({
		url: '<c:url value="/feed/feedmain/selectNewFeed"/>',
		type: 'get',
		success: function(data){
			
			console.log(data);
			var memberIdx = '${sessionScope.memberVo.memberIdx}';
			showNewFeed(data);
		}
	});
	/* NEW feed list ajax END */
	
});


/* NEW feed list END */
				
							
	/* feedview login check */
	function feedLoginCheck(memberIdx, boardIdx){
								
		var myIdx = '${sessionScope.memberVo.memberIdx}';
		var memberIdx = memberIdx;
		var boardIdx = boardIdx;
								
		if(!myIdx) {
			alert('로그인 후 이용 가능합니다');
			location.href='<c:url value="/member/login"/>';
		} else {
			location.href='<c:url value="/feed/feedview/'+memberIdx+'&'+boardIdx+'"/>';
		}
								
	};

	/* creator nickname check */
	function feedNicknameCheck(memberIdx){
								
		/* login check */
		var myIdx = '${sessionScope.memberVo.memberIdx}';
		var memberIdx = memberIdx;
								
		if(!myIdx) {
			alert('로그인 후 이용 가능합니다');
			location.href='<c:url value="/member/login"/>';
		} else {
			ocation.href='<c:url value="/feed/userFeed/'+memberIdx+'"/>';
		}
								
	}
							
</script>


</body>
</html>











