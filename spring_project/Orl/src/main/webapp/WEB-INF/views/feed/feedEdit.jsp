<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FEED EDIT</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/feed/editFeed.css'/>">
</head>
<body>

<!-- header -->
<%@ include file="/WEB-INF/frame/default/header.jsp"%>

	<!-- 전체 영역 시작 -->
	<div class="background">
	
	    <!-- 뒤로 가기 (피드 메인) -->
	    <div class="pageBack">
	        <button id="pageBack">
	            <img alt="pageBack" src="<c:url value="/images/feed/feedw/feedButton.png"/>">
	        </button>
	    </div>
	    <!-- 뒤로 가기 끝 -->
	
		<!-- 피드 수정 영역 시작 -->
	    <section class="container_edit">
	
	        <!-- 왼쪽 사진 영역 시작 -->
	        <section class="e_leftbox">
	
	            <!-- 피드 사진 -->
	            <img src="<c:url value="/images/feed/feedw/uploadfile/${selectFeedView.boardPhoto}"/>" alt="feed-img">
	
	            <!-- 태그 버튼 -->
	            <button>
	                <img src="<c:url value="/images/feed/feedw/icon-05.png"/>">
	            </button>
	
	        </section>
	        <!-- 왼쪽 사진 영역 끝 -->
	
	
	
	        <!-- 오른쪽 수정 영역 시작 -->
	        <section class="e_rightbox">
	
	            <!-- 게시자 프로필 영역 -->
	            <div class="e_profile">
	
	                <!-- 게시자 프로필 사진 -->
	                <div class="e_photo">
	                    <button onclick="location.href = '<c:url value="/feed/userfeed/${selectFeedView.memberIdx}"/>'">	<!-- 수정 (09.17.우리) -->
	                        <img src="<c:url value="/images/member/profile/${selectFeedView.memberProfile}"/>" alt="profile-img">	<!-- 수정 (09.16.우리) -->
	                    </button>
	                </div>
	
	                <!-- 게시자 닉네임 -->
	                <a href="<c:url value="/feed/userfeed/${selectFeedView.memberIdx}"/>" class="e_nickname">${selectFeedView.memberNickname}</a>	<!-- 수정 (09.17.우리) -->
	
	            </div>
	            <!-- 게시자 프로필 영역 끝 -->
	            
	            <!-- 수정 폼 시작 -->
	            <form method="post" enctype="multipart/form-data" id="feededitform">
	            	
	            	<!-- 게시글 입력 -->
		           	<div class="contentsbox">
						<p>게시글</p>
						<textarea name="boardDiscription" id="boardDiscription" autocomplete="off">${selectFeedView.boardDiscription}</textarea>	<!-- 수정 (09.17.우리) -->
					</div>
					
					<!-- 태그 입력 -->
					<div class="tagbox">
						<p>태그</p>
						<input type="text" value="${selectFeedView.tag}" name="tag" id="tag" autocomplete="off">
					</div>
					
					<!-- 해시태그 입력 -->
					<div class="hashtagbox">
						<p>해시태그</p>
						<input type="text" placeholder="Enter" name="hashtag" id="hashtag" autocomplete="off">
						
						<div class="hashtagShow">
							<ul id="tag-list"></ul>
						</div>
					</div>
						
					<!-- 게시 버튼 -->
					<div class="submit">
						<input type="submit" class="edit_submit" onclick="edit_submit()" value="게시">
					</div>
					
				</form>
				<!-- 수정 폼 끝 -->
	
	        </section>
	        <!-- 오른쪽 수정 영역 끝 -->
	
	    </section>
	    <!-- 피드 수정 영역 끝 -->
	    
	</div>
	<!-- 전체 영역 끝 -->
	
	
	<%@ include file="/WEB-INF/frame/default/footer.jsp"%>



	<script>
	
	/* 수정 확인 */
	function edit_submit(){
		alert('수정되었습니다');
	}
	
	
	
	$(document).ready(function() {
			
		/******************* 해시태그 시작 *******************/
	
		/* 저장된 해시태그 */
		const feedTag = '${selectFeedView.hashtag}';
		
		/* 추가하는 해시태그 */
		var tag = {};
		var counter = 0;
			
		/* 입력 값을 태그로 생성 */
		function addTag(value) {
			tag[counter] = value;
			counter++; /* del-btn의 고유 id */
		}
		
		/* 저장된 해시태그 리스트 */
		if(feedTag == null) {
			return;
		} else {
			var str = [];
			const feedTagArr = feedTag;
			str = feedTagArr.split(",");
			var html = "";
			for(var idx=1; idx<str.length; idx++) {
				html += "<li class='tag-item'>#" + str[idx] + "<span class='del-btn' idx='" + counter + "'>x" +
				"</span><input type='hidden' name='hashtag' id='rdTag' value=" + str[idx] + "></li>";
			}
			$('#tag-list').html(html);
		}
			
		/* 서버에 제공 */
		$('#feedform').on('submit', function (e) {
			$(this).submit();
		});
		
		/* 추가하는 해시태그 입력 */
		$('#hashtag').on('keypress', function (e) {
				
			var self = $(this);
				
			/* 엔터키나 스페이스바 눌렀을 때 실행 */
			if(e.key == "Enter" || e.keyCode == 32) {
				var tagValue = self.val();	//값 가져오기
							
				if(tagValue !== "") {
					
					var result = Object.values(tag).filter(function (word) {
		            	return word == tagValue;
		            })

		            // 해시태그 중복 확인
		            if (result.length == 0) {
		            	$("#tag-list").append(
		            			"<li class='tag-item'>#" + tagValue + "<span class='del-btn' idx='" + counter + "'>x" +
		                		"</span><input type='hidden' name='hashtag' id='rdTag' value=" + tagValue + "></li>");
		            	
		            	addTag(tagValue);
		                self.val("");
		                
					} else {
						alert("태그값이 중복됩니다");
		                }
		            }
		            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
				}
				
			});
			
		// 삭제 버튼 : 인덱스 검사 후 삭제
		$(document).on("click", ".del-btn", function (e) {
			var index = $(this).attr("idx");
			tag[index] = "";
			$(this).parent().remove();
		});
		
		/******************* 해시태그 끝 *******************/

	
	
	});	
	
	</script>
	
</body>
</html>