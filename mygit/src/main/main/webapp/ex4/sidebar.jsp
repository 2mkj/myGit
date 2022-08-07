<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>프로필 수정</title>
<style>
/* 프로필 사진 */
#MyPic{width:200px; height:200px; border-radius: 50%; margin-top:10px}
#MyNic{font-size:25px; }

/* 사이드 바 */
.side{text-align:center}
.sideList{list-style:none; padding:0px}
.sideList > li {padding: 8px}
li > a{text-decoration: none; color:black; font-size: 20px}
</style>
</head>
<body>
<div class="side">
      <div class="sidebar">
      <!-- 프로필 사진 -->
		<img id="MyPic" src="${pageContext.request.contextPath}/image/minipo.jpg">
      	<span id="MyNic">닉네임</span><br><br>
      <!-- 사이드 바 -->
        <ul class="sideList">
          <li><a href="myProfile">프로필 수정</a></li>
          <li><a href="myReview">작성한 리뷰</a></li>
          <li><a href="myDocuments">작성한 글</a></li>
          <li><a href="myComments">작성한 댓글</a></li>
          <li><a href="logout">로그아웃</a></li>
        </ul>
      </div>
</div>
</body>
</html>