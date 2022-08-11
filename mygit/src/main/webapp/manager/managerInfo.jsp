<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원 정보 보기</title>
 <jsp:include page="../mainpage/top.jsp" />  
<style>
  tr>td:nth-child(odd){font-weight: bold}
  td{text-align:center}
  .container{width:50%}
</style>
</head>
<body>
	<div class="container">
		<table class="table table-boardered">
			<tr>
				<td>아이디</td>
				<td>${managerinfo.email}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${managerinfo.user_name}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${managerinfo.name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${managerinfo.gender}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${managerinfo.phone}</td>
			</tr>
			<tr>
				<td colspan=2>
				<a href="managerList.mg">리스트로 돌아가기</a></td>
			</tr>
		</table>
	</div>	
</body>
</html>