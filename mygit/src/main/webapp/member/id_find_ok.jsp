<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>무빗! 아이디 찾기 성공</title>
<link href="${pageContext.request.contextPath}/css/member/idpw_check.css" type="text/css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.logo {text-align: center !important;}
	
.clearfix {
	text-align: center !important;
	white-space:nowrap;
}

.submitbtn{
	margin:auto;
	white-space:nowrap;
	display:inline-block;
	width:49.4% !important;
}

h4{text-align:center;}
</style>
<script>
	$(function(){
		$("#login").click(function() {
			location.href = "login.net";
		});
		
		$("#pass_find").click(function() {
			location.href = "idpwFind.net";
		});
	})
</script>
</head>
<body>
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>
	<form class=login name="idok" method="post"> <!-- 클래스 이름 바꾸고 css 조정 -->
		<div class="logo">
			<span class="navbar-brand">무빗!</span>
		</div>
		<br><br>
		
		<h4>회원님의 아이디는 (ID)입니다.</h4> <br>
		
		<div class="clearfix">
			<input type="button" class="submitbtn" id="login" value="로그인">
			<input type="button" class="submitbtn" id="pass_find" value="비밀번호찾기">
		</div>
		
	</form>
</body>
</html>