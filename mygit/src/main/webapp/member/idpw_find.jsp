<%@page import="net.member.MemberDAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>무빗! 아이디 및 비밀번호 찾기(아이디)</title>
<link href="${pageContext.request.contextPath}/css/member/idpw_check.css" type="text/css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.logo {text-align: center !important;}
	.clearfix {text-align: center !important;}
	
	body{
	margin-top: 100px;
	line-height: 1.6
	}
	
	.container{
		width: 500px;
		margin: 0 auto;
	}
	
	
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #bbb;
		display: inline-block;
		padding: 10px 50px;
		cursor: pointer;
	}
	
	ul.tabs li.current{
		background: #ededed;
		color: #222;
	}
	
	.tab-content{
		display: none;
		padding: 15px;
	}
	
	.tab-content.current{
		display: inherit;
	}
	
	ul{
		text-align:center;
 	}
 	
</style>
<script>
	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
	})
	
	$(function(){
		$("#id").click(function() {
			location.href = "idFindOk.net";
		});
		
		$("#password").click(function() {
			location.href = "pwFindOk.net";
		});
	})
	
	
	
</script>
</head>
<%
	 request.setCharacterEncoding("UTF-8");
	    String member_name = request.getParameter("member_name");
	     String member_phone = request.getParameter("member_phone");
	     
	MemberDAO2 dao = new MemberDAO2();
	String member_mid = dao.findId(member_name, member_phone); //아이디를 디비에서 가져옴..실패시 널
 
%>
<body>
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>

<form class=login name="id_find" action="idpwOk.net" method="post">
	<div class="logo">
		<span class="navbar-brand">무빗!</span>
	</div>
	<br><br>

	<!-- <form class=login name="id_find" method="post"> -->
	
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab1">아이디찾기</li>
		<li class="tab-link" data-tab="tab2">비밀번호찾기</li>
	</ul>
	
	<div id="tab1" class="tab-content current">
		<b>이름</b>
		<input type="text" name="name1" placeholder="이름을 입력하세요." id="name1" required>
		<span id="name1_message"></span>
		
		<b>전화번호</b>
		<input type="text" name="phone1" placeholder="전화번호를 입력하세요." id="phone1" required>
		<span id="phone1_message"></span>
		
		<div class="clearfix">
			<input type="button" class="submitbtn" id="id" value="다음">
		</div>
	</div>
	
	
	<div id="tab2" class="tab-content">
		<b>아이디</b>
		<input type="text" name="email" placeholder="이메일을 입력하세요." id="email" required>
		
		<b>이름</b>
		<input type="text" name="name2" placeholder="이름을 입력하세요." id="name2" required>
		
		<b>전화번호</b>
		<input type="text" name="phone2" placeholder="전화번호를 입력하세요." id="phone2" required>
		
		<div class="clearfix">
			<input type="button" class="submitbtn" id="password" value="다음">
		</div>
	</div>
</form>
</body>
</html>