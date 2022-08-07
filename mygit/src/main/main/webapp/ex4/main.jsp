<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 사이트 - 무빗!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
var result ='${join_result}';
if(result != ''){
	if(result ==='1'){
		alert('회원 가입을 축하합니다.');
	}else{
		alert('회원 가입에 실패하셨습니다.');
	}
	<%session.removeAttribute("join_result"); %>
}

result ='${logout_message}';
if(result != ''){
	alert(result);
	<%session.removeAttribute("logout_message"); %>
}
var message ='${message}';
if(message!=''){
	alert(message); //로그인에 성공하면 나타날 메시지 입니다.
}
</script>
</head>
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
</style>
<body>
<!-- 상단 메뉴 -->
<div class="header">
<jsp:include page="top.jsp"/>
</div>
<!-- 슬라이드 배너 -->
<jsp:include page="slide.jsp"/>
<br>
<!-- 메인 프리뷰 -->
<jsp:include page="main_preview.jsp"/>
<br><br>
<!-- 하단 -->
<footer>
	<jsp:include page="bottom.jsp"/>
</footer>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>