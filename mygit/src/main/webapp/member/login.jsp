<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>무빗! 로그인</title>
<link href="${pageContext.request.contextPath}/css/member/login.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.logo {text-align: center !important;}
</style>
<script>
	$(function(){
		$(".join").click(function() {
			location.href = "join.net";
		});
		
		$(".id_find").click(function() {
			location.href = "idpwFind.net";
		});
		
		var email = '${email}';
		if (email) {
			$("#email").val(email);
			$("#remember").prop('checked',true);
		}
	})
</script>
</head>
<body>
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>
	<form class=login name="loginform" action="loginOk.net" method="post">
		<div class="logo">
			<span class="navbar-brand">무빗!</span>
		</div>
		<br><br>
		
		<b>아이디</b>
		<input type="text" name="email" placeholder="이메일을 입력하세요." id="email" required>
		
		<b>비밀번호</b>
		<input type="password" name="pass" placeholder="비밀번호를 입력하세요." maxLength="16" required>
		
		<div>
			<input type="checkbox" id="remember" name="remember" value="store">
			<span>아이디 저장</span>
		</div>
		
		<div>
			<input type="checkbox" id="remember_login" name="remember_login" value="store">
			<span>자동 로그인</span>
		</div>
		<br>
		
		<div class="clearfix">
			<button type="submit" class="submitbtn">로그인</button>
		</div>
		
		<div class="idpw_check">
			<a class="id_find">아이디 및 비밀번호 찾기</a>	<!-- 링크 수정 -->
			|
			<a class="join">회원가입</a>
			
		</div>
	</form>
</body>
</html>