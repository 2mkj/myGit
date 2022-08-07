<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
html, body {
      position: relative;
      height: 690px;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
      scroll: no;
    }
    .body::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
	}
    .swiper-container {
      width: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

.swiper-container-vertical>.swiper-pagination-bullets{
    top: unset !important;
    bottom: 10px ;
    left: 0;
    width: 100%;
}
body > div > div.swiper-pagination.swiper-pagination-clickable.swiper-pagination-bullets.swiper-pagination-horizontal{
 bottom: 90px !important;}
.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{
  display : inline-block !important;
  margin: 6px 2px !important;
}
:root {
    --swiper-theme-color: #ffffff !important;
}
.swiper-slide{margin:0 auto; height:550px; background:black;}
.ss1{background-image:url('../image/top.png');background-repeat: no-repeat;background-position: center;}
.ss2{background-image:url('../image/thor.png');background-repeat: no-repeat;background-position: center;}
.ss3{background-image:url('../image/de.png');background-repeat: no-repeat;background-position: center;}

.ss1_title, .ss2_title, .ss3_title{
  position: absolute;
  bottom: 240px;
  left: 322px;
  font-size: 18px;
  margin: 0 auto;
  font-size: 40px;
  opacity: 0.8;
}
</style>
</head>
<body>
<!-- swiper슬라이더 메인컨테이너 -->
<div class="swiper-container">
  <!-- 보여지는 영역 -->
  <div class="swiper-wrapper">
    <!-- div class="swiper-slide" 를 추가하면된다 -->
    <div class="swiper-slide ss1" style="cursor:pointer;" onclick="location.href='#'"><div class="ss1_title">탑건: 매버릭</div></div>
    <div class="swiper-slide ss2" style="cursor:pointer;" onclick="location.href='#'"><div class="ss2_title">토르: 러브 앤 썬더</div></div>
    <div class="swiper-slide ss3" style="cursor:pointer;" onclick="location.href='#'"><div class="ss3_title">헤어질 결심</div></div>

  </div>
  <!-- 페이징 버튼 처리 -->
  <div class="swiper-pagination"></div>

  <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>
<script>
const swiper = new Swiper('.swiper-container', {
	  //기본 셋팅
	  //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
	  direction: 'horizontal',
	  //한번에 보여지는 페이지 숫자
	  slidesPerView: 1,
	  //페이지와 페이지 사이의 간격
	  spaceBetween: 0,
	  //드레그 기능 true 사용가능 false 사용불가
	  debugger: true,
	  //마우스 휠기능 true 사용가능 false 사용불가
	  mousewheel: false,
	  //반복 기능 true 사용가능 false 사용불가
	  loop: true,
	  //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
	  centeredSlides: true,
	  // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
	  effect: 'fade',
	  
	  
	  //자동 스크를링
	  autoplay: {
	    //시간 1000 이 1초
	    delay: 4500,
	    disableOnInteraction: false,
	   },
	  
	  //페이징
	  pagination: {
	    //페이지 기능
	    el: '.swiper-pagination',
	    //클릭 가능여부
	    clickable: true,
	  },

	  //방향표
	  navigation: {
	    //다음페이지 설정
	    nextEl: '.swiper-button-next',
	    //이전페이지 설정
	    prevEl: '.swiper-button-prev',
	  },
	  
	});
</script>
</body>
</html>