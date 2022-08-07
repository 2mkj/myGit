<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판 글쓰기</title>
<jsp:include page="../mainpage/top.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form id="wrtFrm" action="CommunityAddAction.co" method="post" >
<h1>커뮤니티 게시판</h1>
<input type="hidden" name="name" value="${email}">
<p>제목</p>
<input type="text" name="subject">
<p>내용</p>
<div>
<textarea name="content" style="height:200px">
</textarea>
</div>
<button type="submit" class="addcommu">올리기</button>
</form>
</body>
</html>