<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>무빗! 아이디 및 비밀번호 찾기 실패</title>
<link href="${pageContext.request.contextPath}/css/member/idpw_check.css" type="text/css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.logo {text-align: center !important;}
	
.clearfix {
	text-align: center !important;
	white-space:nowrap;
}

h4{text-align:center;}
</style>
</head>
<body>
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>
	<form class=login name="idpwerror" method="post">
		<div class="logo">
			<span class="navbar-brand">무빗!</span>
		</div>
		<br><br>
		
		<h4>등록된 정보가 없습니다.</h4><br><br>
		
		<div class="clearfix">
			<button type="submit" class="submitbtn">다시 찾기</button>
			<button type="submit" class="submitbtn">회원가입</button>
		</div>
		
	</form>
</body>
</html>