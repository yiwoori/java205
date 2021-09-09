<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CREATE FEED</title>
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/feed/createfeed.css'/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<form method="post" enctype="multipart/form-data">

		<section class="container_create">
			<button type="button" class="c_close">
				<img src="<c:url value="/images/feed/feedw/close.png"/>">
			</button>

			<section class="c_leftbox" id="image_container">
				<img id="preview-img">
			</section>

			<section class="c_rightbox">
				<div class="c_profile">
					<div class="c_photo">
						<button>
							<img src="<c:url value="/images/feed/feedw/profile.jpg"/>"
								alt="profile-img">
						</button>
					</div>
					<a href="#" class="c_nickname">${sessionScope.memberVo.memberNickname}</a>


					<div class="filebox">
						<label for="fileupload">사진선택</label> <input type="file"
							id="fileupload" name="boardPhoto" id="boardPhoto" onchange="readURL(this);">
					</div>


				</div>

				<div class="contentsbox">
					<p>게시글</p>
					<input type="text" placeholder="문구 입력" name="boardDiscription" id="boardDiscription">
				</div>

				<div class="hashtabbox">
					<p>해시태그</p>
					<input type="text" placeholder="#..." name="hashtag" id="hashtag">
				</div>

				<div class="tagbox">
					<p>태그</p>
					<input type="text" placeholder="@..." name="tag" id="tag">
				</div>

				<div class="submit">
					<input type="submit" class="feed_submit" value="게시">
				</div>

			</section>

		</section>
	</form>



	<script>
		/* modal_createfeed */
		$(function() {
			/* modal open */
			$(".modalbtn_createfeed").click(function() {
				$(".modal_createfeed").fadeIn();
				/* body - not scroll */
				$("html, body").addClass("not_scroll");
			});

			/* modal close */
			$(".c_close").click(function() {
				$(".modal_createfeed").fadeOut();
				/* body - scroll */
				$("html, body").removeClass("not_scroll");
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

		/* Feed List Ajax */
		$('.feed_submit').click(function() {
			
			var params = {
				boardPhoto : $('.boardPhoto').val(),
				boardDiscription : $('.boardDiscription').val(),
				hashtag : $('.hashtag').val(),
				tag : $('tag').val()
			}
			
			$.ajax({
				type : "POST",
				url : 'http://localhost:8080/orl/feed/feedmain',
				data : params,
				success : function(res) {
					alert("게시완료")
				},
				error : function(){
					alert("게시실패")
				}
			});
			
		});
		
	</script>



</body>

</html>