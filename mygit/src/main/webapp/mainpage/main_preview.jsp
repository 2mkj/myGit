<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>main_preview</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars/">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/mymaincss/main_preview.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">
</head>
<body>
 <div class="container marketing">
    <div class="row">
    <div style="height:346px;">
   <div>
   <img src="${pageContext.request.contextPath}/image/mymainimg/newfilm.png" width=44 height=44 id="film_icon">
   <p class="mainsub m1"> 최신 영화</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/bisang.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/toppo.png"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/depo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/kopo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/minipo.jpg"></td>
    </tr>
    <tr>
    	<td>비상선언</td>
    	<td>탑건:매버릭</td>
    	<td>헤어질 결심</td>
    	<td>외계+인 1부</td>
    	<td>미니언즈 2</td>
    </tr>
    </table>
    </div>
    </div>
    <div style="height:346px;">
   <div>
   <img src="${pageContext.request.contextPath}/image/mymainimg/hitfilm.png" width=44 height=44 id="film_icon">
   <p class="mainsub m1"> 추천 영화</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/bisang.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/toppo.png"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/depo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/kopo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/mymainimg/minipo.jpg"></td>
    </tr>
    <tr>
    	<td>비상선언</td>
    	<td>탑건:매버릭</td>
    	<td>헤어질 결심</td>
    	<td>외계+인 1부</td>
    	<td>미니언즈 2</td>
    </tr>
    </table>
    </div>
    </div>
   <div style="background:#e3e3e3; width:8000px; height:400px;border-radius: 30px;">
   <div>
   <img src="${pageContext.request.contextPath}/image/mymainimg/commu.png" width=40 height=40 id="commu_icon">
   <p class="mainsub m2">커뮤니티</p>
   </div>
   <div class="table-box">
    <table class="table--min commu">
    
    
    <c:set var="num" value="${listcount-(page-1)*limit}" />
     <c:forEach var="b" items="${boardlist}">
     <tr>
      <td><%-- 번호 --%>
       <c:out value="${num}"/><%--출력 --%>
       <c:set var="num" value="${num-1}" /> <%--num=num-1;의미 --%>
	  </td>
	 <td><%--제목 --%>
	  	 <a href="CommunityDetail.co?num=${b.board_num}">
	  	   <c:if test="${b.board_subject.length()>=20}">
	  	     <c:out value="${b.board_subject.substring(0,20)}..." />
	  	   </c:if>
	  	   <c:if test="${b.board_subject.length()<20}">
	  	     <c:out value="${b.board_subject}" />
	  	   </c:if>
	  	 </a>[${b.cnt}]
	  </td>
	  <td><div>${memberinfo.user_name}</div></td>
	  <td><div>${b.board_date}</div></td>
	  <td><div>${b.board_readcount}</div></td>
	  </tr>
	  </c:forEach>
    </table>
    </div>
   </div>
    </div><!-- /.row -->
</div>
</body>
</html>