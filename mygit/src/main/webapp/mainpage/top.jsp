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
<link href="${pageContext.request.contextPath}/css/mymaincss/navbar.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
    <div class="container">
      <a class="navbar-brand" href="main.net">무빗!</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
	   
      <div class="collapse navbar-collapse" id="navbarsExample07">
       
        <!-- 비회원 -->
       <c:if test="${empty email}">
        <ul class="navbar-nav mi-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link " href="newmovie.mg">영화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="Community.co">커뮤니티</a>
          </li>
        </ul>
        </c:if>
        
		<!-- 회원 로그인 -->
        <c:if test="${!empty email}">
        <ul class="navbar-nav mi-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link " href="newmovie.mg">영화</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="Community.co">커뮤니티</a>
          </li>
        </ul>
        </c:if>
        
        <!-- 검색바 -->
        <form class="searcharea" role="search" >
        <input class="form-control" type="search" placeholder="영화 검색...">
        </form>
        <div class="search_btn">
         <span><i class="fa fa-search"></i></span>
		</div>
		
        <!-- 로그인 / 회원가입 버튼 -->
        <c:if test="${empty email}">
            <div id="btn_group">
				  <a href="login.net" style="text-decoration: none"><input type="button" id="btn1" value="로그인" ></a>
				  <a href="join.net" style="text-decoration: none"><input type="button" id="btn2" value="회원가입"></a>
			</div>  
        </c:if>
        
        <!-- 회원 로그인 -->
          <c:if test="${email!='admin' && !empty email}">
		<div class="dropdown">
  			<button class="dropbtn">${memberinfo.user_name}  <span><i class="fa fa-angle-down"></i></span></button>
  			<div class="dropdown-content">
   			 <a href="myProfile.net">프로필 수정</a>
   			 <a href="myReview.net">작성한 리뷰</a>
   			 <a href="myWriting.net">작성한 글</a>
   			 <a href="myComments.net">작성한 댓글</a>
   			 <a href="logout.net">로그아웃</a>
  			</div>
		</div>
        </c:if>
                
        <!-- 관리자 로그인 -->
        <c:if test="${email=='admin'}">
        <div class="dropdown">
  			<button class="dropbtn admin">관리자  <span><i class="fa fa-angle-down"></i></span></button>
        <div class="dropdown-content">
   			 <a href="managerList.mg">관리자페이지</a>
   			 <a href="myProfile.net">프로필 수정</a>
   			 <a href="logout.net">로그아웃</a>
  			</div>
		</div>
        </c:if>
            
      </div>
    </div>
  </nav>
  
  </body>
</html>
