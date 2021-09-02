<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateFeed</title>
<link rel="stylesheet" href="<c:url value='/css/feed/createfeed.css'/>">
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
</head>
<body>

	<!-- 닫기버튼 -->
    <section class="container">
        <button><img src="<c:url value="/images/feed/feedw/닫기.png"/>"></button>

        <section class="leftbox">
            <img src="<c:url value="/images/feed/feedw/feed.png"/>" alt="feed-img">
        </section>

        <section class="rightbox">
            <div class="profile">
                <div class="photo">
                    <button><img src="<c:url value="/images/feed/feedw/profile.jpg"/>" alt="profile-img"></button>
                </div>
                <a href="#" class="nickname">NICKNAME</a>
                <div class="filebox">
                	<label for="fileupload">사진선택</label>
                	<input type="file" id="fileupload">
                </div>
            </div>

            <div class="contentsbox">
                <p>게시글</p>
                <input type="text" placeholder="문구 입력">
            </div>

            <div class="hashtabbox">
                <p>해시태그</p>
                <input type="text" placeholder="#...">
            </div>

            <div class="tagbox">
                <p>태그</p>
                <input type="text" placeholder="@...">
            </div>

            <div class="submit">
                <button type="submit">게 시</button>
            </div>

        </section>

    </section>

</body>
</html>