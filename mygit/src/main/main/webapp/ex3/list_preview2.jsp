<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars/">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
@font-face {
    font-family: 'a시월구일2';
    src: url('../font/a시월구일2.ttf') format('truetype');
}
body > div.container.marketing{padding:0 10px!important}
.fw-normal{color:black;font-family: 'Noto Sans KR', sans-serif; font-size:20px; margin: 0 35px;}
.row{margin:0 80px 0 100px;}
.body{text-align:center;}
.mainsub{color:black; font-size:30px; font-family: 'a시월구일2','Noto Sans KR', sans-serif;}
.m1{margin-left:53px;margin-right:57px; margin-bottom: 15px;}
.m2{margin-left:50px;margin-right:50px; margin-bottom: 15px;}
#film_icon{float:left; margin-top:-7px;}
#commu_icon{float:left; margin-top:-3px;}
table{margin:10px auto; text-align: center; }
td{color:#101010 !important; padding: 10px 40px}
img{border-radius: 10px;}

.table {
  table-layout:fixed;
  width:100%;
  text-align:center;
}
.table td, .table th {
  padding:16px 20px 0 20px;;
  border-top:1px solid #ccc;
  word-break:break-all
}
.table--min {
  min-width:900px;
}

@media screen and (max-width:1200px) {
  .table-box {
    overflow-x:auto;
  }
}
</style>
</head>
<body>
 <div class="container marketing">
    <div class="row">
   
    <div style="background:#e3e3e3; width:8000px; height:350px;border-radius: 30px;">
   <div>
   <img src="../image/film.png" width=42 height=42 id="film_icon">
   <p class="mainsub m1">영화</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    	<td><img src="../image/toppo.png" width=140 height=180></td>
    	<td><img src="../image/thopo.jpg" width=140 height=180></td>
    	<td><img src="../image/depo.jpg" width=140 height=180></td>
    	<td><img src="../image/kopo.jpg" width=140 height=180></td>
    	<td><img src="../image/minipo.jpg" width=140 height=180></td>
    </tr>
    <tr>
    	<td>탑건:매버릭</td>
    	<td>토르:러브 앤 썬더</td>
    	<td>헤어질 결심</td>
    	<td>외계+인 1부</td>
    	<td>미니언즈 2</td>
    </tr>
    </table>
    </div>
    </div>
   <br><br><br><br>  
   <div style="background:#e3e3e3; width:8000px; height:400px;border-radius: 30px;">
   <div>
   <img src="../image/commu.png" width=40 height=40 id="commu_icon">
   <p class="mainsub m2">커뮤니티</p>
   </div>
   <div class="table-box">
    <table class="table table--min">
    <tr>
    <td></td>
    </tr>
    </table>
    </div>
   </div>
    </div><!-- /.row -->
</div>
</body>
</html>