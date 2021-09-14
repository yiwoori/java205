<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FEED VIEW</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/default/default.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/feed/feedview.css'/>">
</head>
<body>

<!-- header -->
<%@ include file="/WEB-INF/frame/default/header.jsp"%>

	<!-- modal_feededit -->
 	<div class="modal_feedEdit">
		<div class="modal_content">
			<section class="container">
				<%@ include file="/WEB-INF/views/feed/feedEdit.jsp"%>
			</section>
		</div>
	</div>

<!-- background START -->
<div class="background">

    <!-- page back -->
    <div class="pageBack">
        <button id="pageBack">
            <img alt="pageBack" src="<c:url value="/images/feed/feedw/feedButton.png"/>">
        </button>
    </div>

    <section class="container_view">

        <!-- feed photo START -->
        <section class="v_leftbox">

            <!-- feed photo -->
            <img src="<c:url value="/images/feed/feedw/uploadfile/${selectFeedView.boardPhoto}"/>" alt="feed-img">

            <!-- tag button -->
            <button>
                <img src="<c:url value="/images/feed/feedw/icon-05.png"/>">
            </button>

        </section>
        <!-- feed photo END -->



        <!-- info START -->
        <section class="v_rightbox">

            <!-- profile START -->
            <div class="v_profile">

                <!-- feed creator profile photo -->
                <div class="v_photo">
                    <button onclick="location.href = '<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>'">
                        <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="profile-img">
                    </button>
                </div>

                <!-- feed creator nickname -->
                <a href="<c:url value="/feed/userFeed/${selectFeedView.memberIdx}"/>" class="v_nickname">${selectFeedView.memberNickname}</a>
                <!-- <button>팔로우</button> -->

                <!-- option button -->
                <c:if test="${sessionScope.memberVo.memberIdx eq selectFeedView.memberIdx}">
                    <div class="edit_div"><button class="v_edit feedview_btn">수정</button></div>
                    <div class="delete_div"><button class="v_delete feedview_btn">삭제</button></div>
                </c:if>

                <!-- feed contents & hashtag -->
                <div class="contents">
                    <p>${selectFeedView.boardDiscription}</p>
                    <div> <a class="hashtag">${selectFeedView.hashtag}</a> </div>
                </div>

            </div>
            <!-- profile END -->



            <!-- comment START -->
            <section class="commentbox">
                <div id="cmt">
                    <%--    <div id="newCntSection"></div>
                        <!-- DB comment load (GET) START -->
                        <c:forEach var="selectFeedComment" items="${selectFeedComment}">
                        
                            <div class="comments">
                            
                                <!-- profile photo -->
                                <div class="cmt-profile">
                                    <button onclick="location.href = '<c:url value="/feed/userFeed/${selectFeedComment.memberIdx}"/>'">
                                        <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="cmt-profile-img">
                                    </button>
                                </div>
                                
                                <!-- comment -->
                                <div class="comment">
                                    <a href="<c:url value="/feed/userFeed/${selectFeedComment.memberIdx}"/>" class="v_nickname">${selectFeedComment.memberNickname}</a>
                                    <p>${selectFeedComment.comment}</p>
                                </div>
                                
                                <c:if test="${sessionScope.memberVo.memberIdx eq selectFeedComment.memberIdx}">
                                    <div>
                                        <a class="comment_edit" onclick="commentEdit(${selectFeedComment.boardCommentIdx}, ${selectFeedComment.memberIdx}, ${selectFeedComment.comment})">댓글수정</a>
                                    </div>
                                    <div>
                                        <a class="comment_delete" onclick="commentDelete(${selectFeedComment.memberIdx} ${selectFeedComment.boardCommentIdx});">댓글삭제</a>
                                    </div>
                                </c:if>
                                
                            </div>
                        </c:forEach>
                        <!-- DB comment load (GET) END --> --%>

                </div>
            </section>
            <!-- comment END -->



            <!-- commenting START -->
            <section class="commentingbox">

                <!-- commenting nav START -->
                <div class="buttonline">
                    <div>
                        <!-- like -->
                        <button class="like">
                            <img src="<c:url value="/images/feed/feedw/like-black.png"/>"
                                 class="nolike" alt="like-img">
                        </button>


                        <!-- share -->
                        <button class="share">
                            <img src="<c:url value="/images/feed/feedw/share.png"/>"
                                 alt="share-img">
                        </button>
                    </div>
                    <div class="likeline">
                        <p>좋아요 1,000개</p>
                    </div>
                </div>
                <!-- commenting nav END -->

                <!-- commenting form START -->
                <form method="post" enctype="multipart/form-data">
                    <div class="commentingline">

                        <div class="textbox">
                            <input type="text" placeholder="댓글달기" name="comment" id="comment" autofocus>
                        </div>
                        <div class="submitbox">
                            <input type="submit" id="comment_submit" value="게시" onclick="commentSubmit()">
                        </div>

                    </div>
                </form>
                <!-- commenting form END -->

            </section>
            <!-- commenting END -->

        </section>
        <!-- info END -->

    </section>
</div>
<!-- backgroung END -->

<!-- footer -->
<%@ include file="/WEB-INF/frame/default/footer.jsp"%>





<script>

    $(document).ready(function(){

        /* page back */
        $('#pageBack').click(function(){
            history.back();
        });
        
        /* feed edit */
        $('v_edit').click(function(){
        	$.ajax({
        		url: '/feed/feedview/editfeed/{memberIdx}${boardIdx}',
        		type: 'GET',
        		success: function(data) {
        			console.log('feed edit');
        		}
        	});
        });



        /* feed delete */
        $('.v_delete').click(function(){
            $.ajax({
                url : '<c:url value="/feed/feedview/deletefeed/${selectFeedView.memberIdx}&${selectFeedView.boardIdx}"/>',
                type:'POST',
                success : function(data) {
                    if(data==1) {
                        alert('피드가 삭제되었습니다');
                        window.history.back(); /* 피드메인 페이지 다시 로드 */
                    }
                }
            });
        });
        /* feed delete END */



        /* comment list */
        $.ajax({
            url: '<c:url value="/feed/feedview/selectcomment"/>',
            type: 'get',
            data: {
                boardIdx: '${selectFeedView.boardIdx}'
            },
            success: function(data) {
            	
            	console.log(data);
                var memberIdx = '${sessionScope.memberVo.memberIdx}';
                showList(data,memberIdx);
                
            }
        });
        /* comment list END */

        

        /* comment edit */
        function commentEdit(boardCommentIdx, memberIdx, comment){
            $.ajax({
                url: '<c:url value="/feed/feedview/editcomment/'+memberIdx+'&'+boardCommentIdx+'&'+comment+'"/>',
                type: 'POST',
                success: function(data){
                    if(data==1){
                        alert('댓글이 수정되었습니다');
                    }
                }
            });
        };
        /* comment edit END */


        
    });
    /* document ready END */
    

    
    /* comment list */
    function showList(list, memberIdx){
        	
           var html = '';
           var idx = memberIdx;
            
            $.each(list, function(index, item){

                html += '<div class="comments">';
                html += '      <div class="cmt-profile">';
                html += '         <button onclick="location.href = "<c:url value="/feed/userFeed/'+item.memberIdx+'"/>"">';
                html += '            <img src="<c:url value="/images/feed/feedw/defaultPhoto.jpg"/>" alt="cmt-profile-img">';
                html += '         </button>';
                html += '      </div>';
                html += '      <div class="comment">';
                html += '         <a href="<c:url value="/feed/userFeed/'+item.memberIdx+'"/>" class="v_nickname">'+item.memberNickname+'</a>';
                html += '         <p>'+item.comment+'</p>';
                html += '      </div>';

                if (idx == item.memberIdx){
                    //html += '   <div>';
                    //html += '      <a class="comment_edit" onclick="commentEdit(${selectFeedComment.boardCommentIdx}, ${selectFeedComment.memberIdx}, ${selectFeedComment.comment})">댓글수정</a>';
                    //html += '   </div>';
                    html += '   <div>';
                    html += '      <a class="comment_delete" onclick="commentDelete('+item.boardCommentIdx+',${boardIdx})">댓글삭제</a>';
                    html += '   </div>';
                }

                html += '</div>';

                $('#cmt').html(html);
            })
        }
    
    
    
    /* comment submit */
        function commentSubmit() {
    	
    		alert('댓글이 게시되었습니다');
        	/* showList(data,memberIdx); */
        	
    }
        
        
        /* comment delete */
        function commentDelete(boardCommentIdx, boardIdx){
        	
        	var board = boardIdx;
        	var idx = boardCommentIdx;
        	console.log(idx);

            console.log('comment delete ajax start');

            $.ajax({
                url: '<c:url value="/feed/feedview/deletecomment/'+idx+'&'+board+'"/>',
                type: 'POST',
                success: function(data){
                
                    var memberIdx = '${sessionScope.memberVo.memberIdx}';
                    console.log(memberIdx);
                    console.log("delete" + data);
                    
                    alert('댓글이 삭제되었습니다');
                    
                    showList(data,memberIdx);
                    
                }
            });

        };
        
        
        
        
        /* modal_feed edit */
        $(function() {
           /* modal open */
           $(".modalbtn_feedview").click(function() {
              $(".modal_feedview").fadeIn();
              
              /* body - not scroll */
              $("html, body").addClass("not_scroll");
           });

           /* modal close */
           $(".v_close").click(function() {
              $(".modal_feedview").fadeOut();
              /* body - scroll */
              $("html, body").removeClass("not_scroll");
           });
        });
        
        
        
        
        


</script>

</body>
</html>