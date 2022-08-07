<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MAIN</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/blog/">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/style2.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
.bd-placeholder-img {
font-size: 1.125rem;
text-anchor: middle;
-webkit-user-select: none;
-moz-user-select: none;
user-select: none;
}

@media (min-width: 768px) {
.bd-placeholder-img-lg {
font-size: 3.5rem;
 }
}

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
.searchArea{
	width:295px;
	height:36px;
	background:rgba(0,0,0,0.5);
	border-radius: 5;
	margin-top:33px;
	margin-right: 30px
}

.searchArea > form{
	border: 0.5px solid #545454;
	border-radius: 5pt;
	height:35px;
}

.searchArea > form > input{
	border:none;
	width:200px;
	height:35px;
	background:rgba(0,0,0,0.0);
	color:white;
	padding-left:10px;
	outline:none;
	font-family: 'Gowun Dodum', sans-serif;
	font-size:15px;
}
.searchArea > form > span{
	width:30px;
	color:#bbbbbb;
	font-weight:bold;
	cursor: pointer;
	font-size:20px;
}

.searchArea > form > span:hover{
	color:white;
}
</style>
</head>
<body>
    
<div class="container">
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#">무빗</a>
        <a class="link-secondary" href="#">무빗</a>
        <a class="link-secondary" href="#">무빗</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <div class="searchArea">
					<form>
					<input type="search" placeholder="영화 검색...">
					<span><i class="fa fa-search"></i></span>
					</form>
				  </div>
        <a class="btn btn-sm btn-outline-secondary" href="#">로그인</a>
      </div>
    </div>
  </header>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
  </body>
</html>
