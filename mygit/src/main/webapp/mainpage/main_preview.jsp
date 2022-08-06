<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>main_preview</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars/">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main_preview.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">
</head>
<body>
 <div class="container marketing">
    <div class="row">
    <div style="height:346px;">
   <div>
   <img src="${pageContext.request.contextPath}/image/newfilm.png" width=44 height=44 id="film_icon">
   <p class="mainsub m1"> 최신 영화</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="${pageContext.request.contextPath}/image/bisang.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/toppo.png"></td>
    	<td><img src="${pageContext.request.contextPath}/image/depo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/kopo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/minipo.jpg"></td>
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
   <img src="${pageContext.request.contextPath}/image/hitfilm.png" width=44 height=44 id="film_icon">
   <p class="mainsub m1"> 추천 영화</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="${pageContext.request.contextPath}/image/bisang.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/toppo.png"></td>
    	<td><img src="${pageContext.request.contextPath}/image/depo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/kopo.jpg"></td>
    	<td><img src="${pageContext.request.contextPath}/image/minipo.jpg"></td>
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
   <img src="${pageContext.request.contextPath}/image/commu.png" width=40 height=40 id="commu_icon">
   <p class="mainsub m2">커뮤니티</p>
   </div>
   <div class="table-box">
    <table class="table--min commu">
    <tr>
    <td>5</td>
    <td>제목5 [10]</td>
    <td>글쓴이</td>
    <td>2022-08-02</td>
    </tr>
    <tr>
    <td>4</td>
    <td>제목4 [4]</td>
    <td>글쓴이</td>
    <td>2022-08-02</td>
    </tr>
    <tr>
    <td>3</td>
    <td>제목3 [2]</td>
    <td>글쓴이</td>
    <td>2022-08-02</td>
    </tr>
    <tr>
    <td>2</td>
    <td>제목2 [1]</td>
    <td>글쓴이</td>
    <td>2022-08-01</td>
    </tr>
    <tr>
    <td>1</td>
    <td>제목1 [0]</td>
    <td>글쓴이</td>
    <td>2022-08-01</td>
    </tr>
    </table>
    </div>
   </div>
    </div><!-- /.row -->
</div>
</body>
</html>