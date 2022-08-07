<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무빗 메인</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
#myCarousel{margin:0}
body{overflow-x:hidden; overflow-y:auto;line-height:none;background:#e3e3e3 !important;}
footer {
  bottom: 0px;
  height: 3rem;
  background-color: #ccc;
  width: 100%;
  text-align: center;
  line-height: 3rem;
  }
  input:focus {outline:2px solid #d50000;}
</style>
<body>
<!-- 상단 메뉴 -->
<jsp:include page="top.jsp"/>
<!-- 슬라이드 배너 -->
<jsp:include page="slide.jsp"/>
<br>
<!-- 메인 프리뷰 -->
<jsp:include page="list_preview2.jsp"/>
<br><br>
<!-- 하단 -->
<footer>
	<jsp:include page="bottom.jsp"/>
</footer>
</body>
</html>