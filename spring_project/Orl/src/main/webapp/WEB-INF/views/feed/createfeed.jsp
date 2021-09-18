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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>

	<!-- 피드 작성 폼 -->
	<form method="post" enctype="multipart/form-data" id="feedform">
		
		<!-- 모달창 시작 -->
		<section class="container_create">
		
			<!-- 모달창 종료 버튼 -->
			<button type="reset" class="c_close">
				<img src="<c:url value="/images/feed/feedw/close.png"/>">
			</button>

			<!-- 왼쪽 프리뷰 영역 -->
			<section class="c_leftbox" id="image_container">
				<img id="preview-img" src="<c:url value="/images/feed/feedw/noImage.png"/>">
			</section>

			<!-- 오른쪽 컨텐츠 영역 -->
			<section class="c_rightbox">
			
				<!-- 작성자 프로필 영역 -->
				<div class="c_profile">
				
					<!-- 작성자 프로필 -->
					<div class="c_photo">
						<button onclick="location.href = '<c:url value="/feed/userfeed/${sessionScope.memberVo.memberIdx}"/>'">	<!-- 수정(09.17.우리) -->
							<img src="<c:url value="/images/member/profile/${member.memberProfile}"/>" alt="profile-img">	<!-- 수정(09.17.우리) -->
						</button>
					</div>
					
					<!-- 작성자 닉네임 -->
					<a href="<c:url value="/feed/userFeed/${sessionScope.memberVo.memberIdx}"/>"
						class="c_nickname">${sessionScope.memberVo.memberNickname}
					</a>

					<!-- 파일 업로드 버튼 -->
					<div class="filebox">
						<label for="fileupload">사진선택</label>
						<input type="file" name="boardPhoto" id="fileupload" onchange="readURL(this);">
					</div>
					
				</div>
				<!-- 작성자 프로필 영역 끝 -->
				
				<!-- 입력 영역 -->
					<!-- 게시글 입력 -->
					<div class="contentsbox">
						<p>게시글</p>
						<textarea placeholder="게시글을 입력해주세요" name="boardDiscription" id="boardDiscription" autocomplete="off"></textarea>	<!-- 수정 (09.17.우리) -->
					</div>
					
					<!-- 태그 입력 -->
					<div class="tagbox">
						<p>태그</p>
						<input type="text" placeholder="@닉네임 입력" name="tag" id="tag" autocomplete="off">
					</div>
					
					<!-- 해시태그 입력 -->
					<div class="hashtagbox">
						<p>해시태그</p>
						<input type="text" placeholder="Enter" name="hashtag" id="hashtag" autocomplete="off">
						
						<div class="hashtagShow">
							<ul id="tag-list"></ul>
						</div>
					</div>
					
					<!-- 피드 작성 버튼 -->
					<div class="submit">
						<input type="submit" class="feed_submit" value="게시">
					</div>
				<!-- 입력 영역 끝 -->
				
			</section>
			<!-- 오른쪽 컨텐츠 영역 끝 -->

		</section>
		<!-- 모달창 끝 -->
		
	</form>
	<!-- 피드 작성 폼 끝 -->





	<script>
	
		$(document).ready(function() {
			
			var tag = {};
			var counter = 0;
			
			/* 입력 값을 태그로 생성 */
			function addTag(value) {
				tag[counter] = value;
				counter++; /* del-btn의 고유 id */
			}
			
			
			/* 서버에 제공 */
			$('#feedform').on('submit', function (e) {
				$(this).submit();
			});
			
			$('#hashtag').on('keypress', function (e) {
				
				var self = $(this);
				
				/* 엔터키나 스페이스바 눌렀을 때 실행 */
				if(e.key == "Enter" || e.keyCode == 32) {
					var tagValue = self.val();	//값 가져오기
					
					console.log('tagValue : '+tagValue);
					
					if(tagValue !== "") {
						//같은 태그 있는지 검사하고 있으면 해당 값이 array로 리턴된다
						var result = Object.values(tag).filter(function (word) {
		                    return word == tagValue;
		                })

		                // 해시태그가 중복되었는지 확인
		                if (result.length == 0) {
		                    $("#tag-list").append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x" +
		                        "</span><input type='hidden' name='crewTag' id='rdTag' value=" + tagValue + "></li>");
		                    addTag(tagValue);
		                    self.val("");
		                } else {
		                    alert("태그값이 중복됩니다.");
		                }
		            }
		            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
				}
			});
			
		    // 삭제 버튼 
		    // 인덱스 검사 후 삭제
		    $(document).on("click", ".del-btn", function (e) {
		        var index = $(this).attr("idx");
		        tag[index] = "";
		        $(this).parent().remove();
		    });
			
		});
	
		/* 모달창 on off */
		$(function() {
			
			/* on */
			$(".modalbtn_createfeed").click(function() {
				$(".modal_createfeed").fadeIn();
				$("html, body").addClass("not_scroll");
			});

			/* off */
			$(".c_close").click(function() {
				$(".modal_createfeed").fadeOut();
				$("html, body").removeClass("not_scroll");
			});
			
		});

		/* 선택 사진 프리뷰 처리 */
		function readURL(input) {
			
			/* Preview load */
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview-img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
			
			/* Preview reset */
			$('.c_close').click(function(){
				$('#preview-img').attr('src', '<c:url value="/images/feed/feedw/noImage.png"/>');
				/* $.removeClass('.tag-item'); */
				/* 수정 필요 */
			});
			
		};
		
		/* 파일 선택 여부 체크 */
		$('.feed_submit').click(function(memberIdx, memberIdx){
			
			var file = $('#fileupload').val();
			
			if(!file){
				alert('사진을 선택해주세요');
				return false;
			} alert('게시 되었습니다');
			
		});
		
		/* 게시글 입력창 줄바꿈 */
		$('#boardDiscription').click(function(){
			var html = $('#boardDiscription').val().replace(/(?:\r\n|\r|\n)/g, '<br />');
		});
		
	</script>

</body>

</html>