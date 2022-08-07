<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>top.jsp</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars/">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
    <div class="container">
      <a class="navbar-brand" href="main">무빗!</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
	   
      <div class="collapse navbar-collapse" id="navbarsExample07">
       
        <!-- 비회원 -->
       <c:if test="${empty id}">
        <ul class="navbar-nav mi-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">영화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티</a>
          </li>
        </ul>
        </c:if>
        
		<!-- 회원 로그인 -->
        <c:if test="${id!='admin' && !empty id}">
        <ul class="navbar-nav mi-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">영화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티</a>
          </li>
        </ul>
        </c:if>
        
       <!-- 관리자 로그인 -->
        <c:if test="${id=='admin'}">
        <ul class="navbar-nav admin-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link " href="#">영화 관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티 관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원 관리</a>
          </li>
        </ul>
        </c:if>
        
        <!-- 검색바 -->
        <form class="searcharea" role="search" >
        <input class="form-control" type="text" placeholder="영화 검색...">
        </form>
        <div class="search_btn">
         <span><i class="fa fa-search"></i></span>
		</div>
		
        <!-- 로그인 / 회원가입 버튼 -->
        <c:if test="${empty id}">
            <div id="btn_group">
				  <a href="login" style="text-decoration: none"><input type="button" id="btn1" value="로그인" ></a>
				  <a href="join" style="text-decoration: none"><input type="button" id="btn2" value="회원가입"></a>
			</div>  
        </c:if>
        
        <!-- 회원 로그인 -->
          <c:if test="${id!='admin' && !empty id}">
		<div class="dropdown">
  			<button class="dropbtn">닉네임1  <span><i class="fa fa-angle-down"></i></span></button>
  			<div class="dropdown-content">
   			 <a href="myProfile">프로필 수정</a>
   			 <a href="#">작성한 리뷰</a>
   			 <a href="#">작성한 글</a>
   			 <a href="#">작성한 댓글</a>
   			 <a href="logout">로그아웃</a>
  			</div>
		</div>
        </c:if>
                
        <!-- 관리자 로그인 -->
        <c:if test="${id=='admin'}">
        <div class="dropdown">
  			<button class="dropbtn admin">관리자  <span><i class="fa fa-angle-down"></i></span></button>
        <div class="dropdown-content">
   			 <a href="#">관리자페이지</a>
   			 <a href="#">프로필 수정</a>
   			 <a href="logout">로그아웃</a>
  			</div>
		</div>
        </c:if>
            
      </div>
    </div>
  </nav>
  
  <!-- 맨위로 버튼 -->
<div style="position:fixed; bottom:15px; right:230px; z-index: 1;">
	<a href="#"><img src="${pageContext.request.contextPath}/image/upup.png" title="위로가기" width=55 height=55></a>
</div>

  </body>
</html>
