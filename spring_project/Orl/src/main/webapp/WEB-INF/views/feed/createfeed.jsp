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

	<%@ include file="/WEB-INF/frame/default/header.jsp"%>

	<!-- 닫기버튼 -->
    <section class="container">
        <button><img src="/FEED/images/닫기.png"></button>

        <section class="leftbox">
            <img src="/FEED/images/feed.png" alt="feed-img">
            <!-- <img src=""> -->
        </section>

        <section class="rightbox">
            <div class="profile">
                <div class="photo">
                    <button><img src="/FEED/images/profile.JPG" alt="profile-img"></button>
                </div>
                <a href="#" class="nickname">NICKNAME</a>
                <button>사진 선택</button>
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

	<%@ include file="/WEB-INF/frame/default/footer.jsp"%>

</body>
</html>