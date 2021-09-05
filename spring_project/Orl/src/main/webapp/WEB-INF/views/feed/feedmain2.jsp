<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/feed/feedmain.css'/>">
<link rel="stylesheet" href="<c:url value='/css/feed/feedview.css'/>">
<link rel="stylesheet" href="<c:url value='/css/feed/createfeed.css'/>">
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





	<!-- feed view -->
	<div class="modal_feedview">
		<div class="modal_content">
			<section class="container">
				<section class="container">
					<button class="close">
						<img src="<c:url value="/images/feed/feedw/close.png"/>">
					</button>

					<section class="leftbox">
						<img
							src="<c:url value="/images/feed/feedw/uploadfile/${Feed.boardPhoto}"/>"
							alt="feed-img">
						<button>
							<img src="<c:url value="/images/feed/feedw/icon-05.png"/>">
						</button>
					</section>

					<section class="rightbox">
						<div class="profile">
							<div class="photo">
								<button>
									<img src="<c:url value="/images/feed/feedw/profile.jpg"/>"
										alt="profile-img">
								</button>
							</div>
							<a href="#" class="nickname">NICKNAME</a>
							<button>팔로우</button>

							<div class="contents">
								<p>${content}</p>
								<div>
									<a class="hashtag">${hashtag}</a>
								</div>
							</div>
						</div>

						<section class="commentbox">
							<div>
								<div class="comments">
									<div class="cmt-profile">
										<button>
											<img
												src="<c:url value="/images/feed/feedw/cmt-profile.jpg"/>"
												alt="cmt-profile-img">
										</button>
									</div>
									<div class="comment">
										<p>
											<a href="#" class="nickname">NICKNAME</a>파일이름:${newFileName}
										</p>
									</div>
								</div>
								<div class="comments">
									<div class="cmt-profile">
										<button>
											<img
												src="<c:url value="/images/feed/feedw/cmt-profile.jpg"/>"
												alt="cmt-profile-img">
										</button>
									</div>
									<div class="comment">
										<p>
											<a href="#" class="nickname">NICKNAME</a>태그 : ${tag}
										</p>
									</div>
								</div>
								<div class="comments">
									<div class="cmt-profile">
										<button>
											<img
												src="<c:url value="/images/feed/feedw/cmt-profile.jpg"/>"
												alt="cmt-profile-img">
										</button>
									</div>
									<div class="comment">
										<p>
											<a href="#" class="nickname">NICKNAME</a>댓글입니다 댓글입니다 댓글입니다
											댓글입니다 댓글입니다 댓글입니다 댓글입니다 댓글입니다 댓글입니다 댓글입니다 댓글입니다 댓글입니다
										</p>
									</div>
								</div>
								<div class="comments">
									<div class="cmt-profile">
										<button>
											<img
												src="<c:url value="/images/feed/feedw/cmt-profile.jpg"/>"
												alt="cmt-profile-img">
										</button>
									</div>
									<div class="comment">
										<p>
											<a href="#" class="nickname">NICKNAME</a>댓글입니다 댓글입니다
										</p>
									</div>
								</div>
								<div class="comments">
									<div class="cmt-profile">
										<button>
											<img
												src="<c:url value="/images/feed/feedw/cmt-profile.jpg"/>"
												alt="cmt-profile-img">
										</button>
									</div>
									<div class="comment">
										<p>
											<a href="#" class="nickname">NICKNAME</a>댓글입니다 댓글입니다 댓글입니다
											댓글입니다 댓글입니다 댓글입니다
										</p>
									</div>
								</div>
							</div>
						</section>

						<section class="commentingbox">
							<div class="buttonline">
								<div>
									<button class="like">
										<img src="<c:url value="/images/feed/feedw/like-black.png"/>"
											class="nolike" alt="like-img">
										<!-- <img src="/images/like.png" class="like-red" alt="nolike-img"> -->
									</button>
									<button class="write">
										<img src="<c:url value="/images/feed/feedw/comment.png"/>"
											alt="comment-img">
									</button>
									<button class="share">
										<img src="<c:url value="/images/feed/feedw/share.png"/>"
											alt="share-img">
									</button>
								</div>
								<div class="likeline">
									<p>좋아요 1,000개</p>
								</div>
							</div>

							<div class="commentingline">
								<div class="textbox">
									<input type="text" placeholder="댓글달기">
								</div>
								<div class="submitbox">
									<input type="submit" value="게시">
								</div>
							</div>
						</section>

					</section>

				</section>
			</section>
		</div>
	</div>
	
	
	
	
	
	<!-- create feed -->
	<div class="modal_createfeed">
		<div class="modal_content">
			<section class="container">
				<form action="#" method="post" enctype="multipart/form-data">

					<section class="container">
						<button class="close">
							<img src="<c:url value="/images/feed/feedw/close.png"/>">
						</button>

						<section class="leftbox" id="image_container">
							<img src="#" id="preview-img" alt="preview">
						</section>

						<section class="rightbox">
							<div class="profile">
								<div class="photo">
									<button>
										<img src="<c:url value="/images/feed/feedw/profile.jpg"/>"
											alt="profile-img">
									</button>
								</div>
								<a href="#" class="nickname">${member.memberNickname}</a>


								<div class="filebox">
									<label for="fileupload">사진선택</label> <input type="file"
										id="fileupload" name="boardPhoto" onchange="readURL(this);">
								</div>


							</div>

							<div class="contentsbox">
								<p>게시글</p>
								<input type="text" placeholder="문구 입력" name="boardDiscription">
							</div>

							<div class="hashtabbox">
								<p>해시태그</p>
								<input type="text" placeholder="#..." name="hashtag">
							</div>

							<div class="tagbox">
								<p>태그</p>
								<input type="text" placeholder="@..." name="tag">
							</div>

							<div class="submit">
								<input type="submit" value="게시">
							</div>

						</section>

					</section>
				</form>
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

		/* Image Preview */
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview-img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

</body>
</html>