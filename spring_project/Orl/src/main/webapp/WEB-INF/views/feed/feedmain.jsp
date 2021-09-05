<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/feed/feedmain.css'/>">
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>


<body>

	<%@ include file="/WEB-INF/frame/default/header.jsp"%>

	<!-- 모달 버튼 -->
	<div class="modalbox">

		<div class="div_createfeed">
			<div>
				<button class="modalbtn_createfeed">
					<img src="<c:url value="/images/feed/feedw/plus.png"/>">
				</button>
			</div>
		</div>

		<div class="space"></div>

		<div class="div_feedview">
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
		</div>
		<div class="feedview_space"></div>
		<div class="div_feedview">
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
		</div>
		<div class="feedview_space"></div>
		<div class="div_feedview">
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
			<div>
				<button class="modalbtn_feedview"></button>
			</div>
		</div>
		<div class="feedview_space"></div>
	</div>


	<!-- 모달창 -->
	<div class="modal_feedview">
		<div class="modal_content">
			<section class="container">
				<%@ include file="/WEB-INF/views/feed/feedview.jsp"%>
			</section>
		</div>
	</div>
	<div class="modal_createfeed">
		<div class="modal_content">
			<section class="container">
				<%@ include file="/WEB-INF/views/feed/createfeed.jsp"%>
			</section>
		</div>
	</div>



	<!-- 피드 메인 -->
	<div>
		<div class="feedmain">
			<div class="top"></div>
			<div class="main">
				<div class="leftbox"></div>
				<div class="mainbox">
					<div class="mountain">
						<img src="<c:url value="/images/feed/feedw/mountain.png"/>">
					</div>
					<div class="feednav">
						<div class="keyword">
							<a href="#">최신</a> <a href="#">인기</a>
						</div>
						<div class="search">
							<input type="text" placeholder="search">
							<button type="submit">
								<img src="<c:url value="/images/feed/feedw/search.png"/>"
									alt="search">
							</button>
						</div>
					</div>
					<div class="feedbox">
						<div class="feed1">
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="feed1">
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="feed1">
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
							<div class="feed">
								<div class="feedsize">
									<img src="<c:url value="/images/feed/feedw/feed.png"/>"
										class="feedimg" alt="feedimg">
								</div>
								<div class="feedinfo">
									<div class="nickname">
										<a href="#">NICKNAME</a>
									</div>
									<div>
										<button>
											<img src="<c:url value="/images/feed/feedw/nolike.png"/>"
												class="nolikeimg">
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="pageline">
						<div class="page">
							<a href="#">1</a>
						</div>
						<div class="page">
							<a href="#">2</a>
						</div>
						<div class="page">
							<a href="#">3</a>
						</div>
					</div>

				</div>
				<div class="rightbox"></div>
			</div>
			<div class="bottom"></div>
		</div>
	</div>

	<%@ include file="/WEB-INF/frame/default/footer.jsp"%>

	<script>
		/* modal_feedview */
		$(function() {
			$(".modalbtn_feedview").click(function() {
				$(".modal_feedview").fadeIn();
			});
			$(".close").click(function() {
				$(".modal_feedview").fadeOut();
			});
		});

		/* modal_createfeed */
		$(function() {
			$(".modalbtn_createfeed").click(function() {
				$(".modal_createfeed").fadeIn();
			});
			$(".close").click(function() {
				$(".modal_createfeed").fadeOut();
			});
		});
	</script>

</body>
</html>