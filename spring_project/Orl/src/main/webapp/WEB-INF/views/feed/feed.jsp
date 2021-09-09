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
</head>
<body>

	<div>
		<div class="feedmain">
			<div class="top">
				<div></div>
				<div class="h1box">
					<div>
						<h1>FEED</h1>
					</div>
					<!-- 최신순일땐 NEW FEED / 인기순일땐 POPULAR FEED -->
					<!-- div class="div_createfeed">
						<div>
							<button class="modalbtn_createfeed">피드 올리기</button>
						</div>
					</div> -->
				</div>
				<div></div>
			</div>
			<div class="main">
				<div class="leftbox"></div>
				<div class="mainbox">

					<!-- 산 아이콘 -->
					<div class="mountain">
						<img src="<c:url value="/images/feed/feedw/mountain.png"/>">
					</div>

					<!-- 네비 영역 시작 -->
					<div class="feednav">
						<div class="keyword">
							<!-- 기본 정렬 (최신순) -->
							<a href="#">최신</a>
							<!-- 선택 정렬 (인기순) -->
							<a href="#">인기</a>
						</div>

						<!-- 피드 작성 버튼 (로그인 상태에서만 보이게)-->
						<c:if test="${sessionScope.memberVo ne null}">
							<div class="div_createfeed">
								<div>
									<button class="modalbtn_createfeed">피드 올리기</button>
								</div>
							</div>
						</c:if>
						
						
						
						
						
						
						
						
						

						<!-- 피드 검색 -->
						<div class="search">
							<input type="text" placeholder="search">
							<button type="submit">
								<img src="<c:url value="/images/feed/feedw/search.png"/>"
									alt="search">
							</button>
						</div>

					</div>
					<!-- 네비 영역 끝 -->

					<!-- 피드 영역 시작 -->
					<div class="feedbox">

						<c:forEach var="selectNewFeed" items="${selectNewFeed}">

							<div class="feed">
								<div class="feedsize">
									<button class="modalbtn_feedview" type="button"
										onclick="location.href='feedview/${selectNewFeed.memberIdx}&${selectNewFeed.boardIdx}'">
										<img
											src="<c:url value="/images/feed/feedw/uploadfile/${selectNewFeed.boardPhoto}"/>"
											class="feedimg" alt="feedimg">
									</button>
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#" class="nickname2">${selectNewFeed.memberNickname}</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>

						</c:forEach>

					</div>
					<!-- 피드 영역 끝 -->


				</div>
				<div class="rightbox"></div>
			</div>
			<div class="bottom"></div>
		</div>
	</div>

</body>
</html>