<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars/">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/mymaincss/main_preview.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">
<style>
#myCarousel{margin:0}
body{
	overflow-x:hidden; 
	overflow-y:auto;
	line-height:none;
	background:#e3e3e3 !important;}
	
/* 드롭다운메뉴 맨위로 */
.header {position:relative;z-index:2; margin:0;padding:0;} 
body {zoom: 1;position:relative;z-index:1}

footer {
  bottom: 0px;
  height: 3rem;
  background-color: #ccc;
  width: 100%;
  text-align: center;
  line-height: 3rem;
  }
   button{
  	border:none;
  }
</style>
<body>
<!-- 상단 메뉴 -->
<div class="header">
<jsp:include page="../mainpage/top.jsp"/>
</div>
 <div class="container marketing">
    <div class="row">
    <div style="height:346px;">
   <div>
   <p class="mainsub m1">인기 영화<button class="btn_menu_toolbar btn_menu_type2">▽</button></p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="../image/mymainimg/bisang.jpg"></td>
    	<td><img src="../image/mymainimg/toppo.png"></td>
    	<td><img src="../image/mymainimg/depo.jpg"></td>
    	<td><img src="../image/mymainimg/kopo.jpg"></td>
    	<td><img src="../image/mymainimg/minipo.jpg"></td>
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
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="../image/mymainimg/bisang.jpg"></td>
    	<td><img src="../image/mymainimg/toppo.png"></td>
    	<td><img src="../image/mymainimg/depo.jpg"></td>
    	<td><img src="../image/mymainimg/kopo.jpg"></td>
    	<td><img src="../image/mymainimg/minipo.jpg"></td>
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
    </div>
    </div>
      <div style="height:346px;">
   <div>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="../image/mymainimg/bisang.jpg"></td>
    	<td><img src="../image/mymainimg/toppo.png"></td>
    	<td><img src="../image/mymainimg/depo.jpg"></td>
    	<td><img src="../image/mymainimg/kopo.jpg"></td>
    	<td><img src="../image/mymainimg/minipo.jpg"></td>
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
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="../image/mymainimg/bisang.jpg"></td>
    	<td><img src="../image/mymainimg/toppo.png"></td>
    	<td><img src="../image/mymainimg/depo.jpg"></td>
    	<td><img src="../image/mymainimg/kopo.jpg"></td>
    	<td><img src="../image/mymainimg/minipo.jpg"></td>
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
    <footer>
	<jsp:include page="../mainpage/bottom.jsp"/>
</footer>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>