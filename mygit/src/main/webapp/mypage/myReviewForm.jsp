<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>프로필 수정</title>
<link href="css/mymaincss/my.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.6.0.js"></script>
</head>
<body class="updatebody">
   <form class="update">
   <h3>작성한 리뷰</h3>
	<hr>
<%-- 게시글이 있는 경우 --%>
<c:if test="${listcount > 0 }">
<table class="mytable">
    <tbody class="myreview">
     <c:set var="num" value="${listcount-(page-1)*limit}" />
     <c:forEach var="b" items="${boardlist}">
     <tr>
     <td><b>&lt;영화제목&gt;</b></td>
	 <td><%--제목 --%>
	  <div>
	  	 <a href="BoardDetailAction.bo?num=${b.board_num}">
	  	   <c:if test="${b.board_subject.length()>=20}">
	  	     <c:out value="${b.board_subject.substring(0,20)}..." />
	  	   </c:if>
	  	   <c:if test="${b.board_subject.length()<20}">
	  	     <c:out value="${b.board_subject}" />
	  	   </c:if>
	  	 </a>
	  </div>
	  </td>
	  <td><div>${b.board_date}</div></td>
	  <td><div> <img id="modifybtn" onclick="location.href='boardModify.bo'" src="image/mymainimg/modify.png" style="width:17px;height:17px">
	  <img id="deletebtn1" onclick="location.href='boardDelete.bo'" src="image/mymainimg/trash.png" style="width:16px;height:17px"></div></td>
	  </tr>
	  </c:forEach>
	  </tbody>
	 </table>
</c:if> <%--<c:if test="${listcount > 0}"> end --%>
        
<%--게시글이 없는 경우 --%>
<c:if test="${listcount == 0 && empty search_word}">
  <h3 style="color:gray; text-align:center; margin:100px 0;">등록된 리뷰가 없습니다.</h3>
</c:if>

<c:if test="${listcount == 0 && !empty search_word}">
  <h3 style="color:gray; text-align:center; margin:100px 0;">검색 결과가 없습니다</h3>
  </c:if>	 
<div class="center-block">
	<ul class="pagination justify-content-center">
	  <c:if test="${page <= 1 }">
		<li class="page-item hovernone">
		 <a>&lt;</a>
		</li>
	  </c:if>
 	  <c:if test="${page > 1 }">
		<li class="page-item">
		 <a  href="myWriting.net?page=${page-1}">&lt;</a>
		</li>
	  </c:if>
	  
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
	   <c:if test="${a == page}">
		 <li class="page-item ">
			<a class="page-Link pageActive">${a}</a>
		 </li>
	   </c:if>
	   <c:if test="${a != page }"> 
	 	 <li class="page-item">
			<a href="myWriting.net?page=${a}" 
			   class="page-Link">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	 
	 <c:if test="${page >= maxpage }">
		<li class="page-item">
		 <a>&gt;</a>
		</li>
	  </c:if>
 	  <c:if test="${page < maxpage }">
		<li class="page-item">
		 <a  href="myWriting.net?page=${page+1}">&gt;</a>
		</li>
	  </c:if>
	</ul>
	<!-- 검색 폼 영역 -->
      <div class="my_search">
          <input id='mySearchinput' />
          <button type='button' class='mySearch1'>검색</button>
      </div>	 
</div>
  </form>
<script>
//페이징 active 처리
$(function(){
    var pageBtn = $(".pagination > li");    
     pageBtn.find(".page-Link").click(function(){   
     pageBtn.removeClass("pageActive");    
     $(this).parent().addClass("pageActive"); 
    })
   });    
</script>
</body>
</html>