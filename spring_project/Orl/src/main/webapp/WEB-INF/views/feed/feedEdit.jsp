<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FEED Edit</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/feed/feedmain.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/feed/createfeed.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/feed/feededit.css'/>">
</head>
<body>

    <section class="container_edit">
    
    	<!-- modal close button -->
		<button type="reset" class="e_close">
			<img src="<c:url value="/images/feed/feedw/close.png"/>">
		</button>

        <!-- feed photo START -->
        <section class="e_leftbox">

            <!-- feed photo -->
            <img src="<c:url value="/images/feed/feedw/uploadfile/${selectFeedView.boardPhoto}"/>" alt="feed-img">

            <!-- tag button -->
            <button>
                <img src="<c:url value="/images/feed/feedw/icon-05.png"/>">
            </button>

        </section>
        <!-- feed photo END -->



        <!-- right box START -->
        <section class="e_rightbox">

            <!-- profile START -->
            <div class="e_profile">

                <!-- feed creator profile photo -->
                <div class="e_photo">
                    <button onclick="location.href = '<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>'">
                        <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="profile-img">
                    </button>
                </div>

                <!-- feed creator nickname -->
                <a href="<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>" class="e_nickname">${selectFeedView.memberNickname}</a>
                <!-- <button>팔로우</button> -->

            <!-- profile END -->
			
			
			<!-- contents form START -->
			<form method="post" enctype="multipart/form-data" id="feedform">
				<div class="contentsbox">
					<p>게시글</p>
					<input type="text" placeholder="문구 입력" name="boardDiscription" id="boardDiscription">
				</div>
				<div class="hashtagbox">
					<p>해시태그</p>
					<input type="text" placeholder="#..." name="hashtag" id="hashtag">
				</div>
	
				<div class="tagbox">
					<p>태그</p>
					<input type="text" placeholder="@..." name="tag" id="tag">
				</div>
					
				<!-- feed submit -->
				<div class="submit">
					<input type="submit" class="edit_submit" value="게시">
				</div>
			</form>
			<!-- contents form END -->

        </section>
        <!-- right box END -->

    </section>
    
    
    
    <script>
    
	/* modal_createfeed */
	$(function() {
		
		/* modal open */
		$(".v_edit").click(function() {
			$(".modal_feedEdit").fadeIn();
			/* body - not scroll */
			$("html, body").addClass("not_scroll");
		});

		/* modal close */
		$(".c_close").click(function() {
			$(".modal_feedEdit").fadeOut();
			/* body - scroll */
			$("html, body").removeClass("not_scroll");
		});
		
	});
	
	/* upload check */
	$('.edit_submit').click(function(){
		
		alert('수정 되었습니다');
		
	});
	
    </script>


</body>
</html>