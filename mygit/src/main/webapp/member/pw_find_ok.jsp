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
	
.clearfix {text-align: center !important;}

h4{text-align:center;}

.submitbtn {width:50% !important;}
</style>
<script>
	$(function(){
		$("#login").click(function() {
			location.href = "login.net";
		});
	})
</script>
</head>
<body>
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>
	<form class=login name="pwok" method="post">	<!-- 클래스 이름 바꾸고 css 조정 -->
		<div class="logo">
			<span class="navbar-brand">무빗!</span>
		</div>
		
		<br><br>
		
		<h4>이메일로 임시 비밀번호를 발송했습니다.</h4>
		<h4>해당 이메일을 확인해주세요.</h4><br>
		
		<div class="clearfix">
			<input type="button" class="submitbtn" id="login" value="로그인">
		</div>
	</form>
</body>
</html>