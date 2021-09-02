<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateFeed2</title>
<link rel="stylesheet" href="<c:url value='/css/feed/createfeed.css'/>">
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<!-- 닫기버튼 -->
	<form action="feedview" method="post" enctype="multipart/form-data">
		<section class="container">
			<button>
				<img src="<c:url value="/images/feed/feedw/close.png"/>">
			</button>

			<section class="leftbox" id="image_container">
				<img src="<c:url value="/images/feed/feedw/feed.png"/>"
					alt="feed-img">
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


					<div class="filebox">
						<label for="fileupload">사진선택</label>
						<input type="file" id="fileupload" name="boardPhoto">
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

</body>

</html>