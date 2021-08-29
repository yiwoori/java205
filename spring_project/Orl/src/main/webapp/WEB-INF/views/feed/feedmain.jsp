<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FeedMain</title>
<link rel="stylesheet" href="<c:url value='/css/feed/feedmain.css'/>">
<link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
</head>
<body>

	<%@ include file="/WEB-INF/frame/default/header.jsp"%>

	<!-- 최신/인기 표시 --> <!-- 페이징 표시 --> <!-- 좋아요 표시 -->
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
                        <a href="#">최신</a>
                        <a href="#">인기</a>
                    </div>
                    <div class="search">
                        <input type="text" placeholder="search">
                        <button type="submit">
                            <img src="<c:url value="/images/feed/feedw/search.png"/>" alt="search">
                        </button>
                    </div>
                </div>
                <div class="feedbox">
                    <div class="feed1">
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="feed1">
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="feed1">
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                        <div class="feed">
                            <div class="feedsize">
                                <a href="#">
                                    <img src="<c:url value="/images/feed/feedw/feed.png"/>" class="feedimg" alt="feedimg">
                                </a>
                            </div>
                            <div class="feedinfo">
                                <div class="nickname">
                                    <a href="#">NICKNAME</a>
                                </div>
                                <div>
                                    <button><img src="<c:url value="/images/feed/feedw/nolike.png"/>" class="nolikeimg"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pageline">
                    <div class="page"><a href="#">1</a></div>
                    <div class="page"><a href="#">2</a></div>
                    <div class="page"><a href="#">3</a></div>
                </div>
                
            </div>
            <div class="rightbox"></div>
        </div>
        <div class="bottom"></div>
    </div>
    
    <%@ include file="/WEB-INF/frame/default/footer.jsp"%>

</body>
</html>