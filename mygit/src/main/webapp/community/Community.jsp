<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>무빗! - 커뮤니티 게시판</title>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../mainpage/top.jsp" />
<script src="js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="css/communitycss/view.css">
</head>
<body>
<!-- 게시판 -->
<form id="comm" method="post" action="CommunityWrite.co">
<input type="hidden" id="email" name="email" value="${memberinfo.email}">
<div class="container community1">
<%-- 게시글이 있는 경우 --%>
<c:if test="${listcount > 0 }">
<div class="rows">
</div>
<table class="table commut">
 <thead>
   <tr>
     <th colspan="5">커뮤니티 게시판</th>
    </tr> 
    <tr>
    	<th><div>번호</div></th>
    	<th><div>제목</div></th>
    	<th><div>글쓴이</div></th>
    	<th><div>날짜</div></th>
    	<th><div>조회</div></th>
    </tr>
    </thead>
    <tbody>
     <c:set var="num" value="${listcount-(page-1)*limit}" />
     <c:forEach var="b" items="${boardlist}">
     <tr>
      <td><%-- 번호 --%>
       <c:out value="${num}"/><%--출력 --%>
       <c:set var="num" value="${num-1}" /> <%--num=num-1;의미 --%>
	  </td>
	 <td><%--제목 --%>
	  <div>
	  	 <a href="CommunityDetail.co?num=${b.board_num}">
	  	   <c:if test="${b.board_subject.length()>=20}">
	  	     <c:out value="${b.board_subject.substring(0,20)}..." />
	  	   </c:if>
	  	   <c:if test="${b.board_subject.length()<20}">
	  	     <c:out value="${b.board_subject}" />
	  	   </c:if>
	  	 </a><span class="commucnt">[${b.cnt}]</span>
	  </div>
	  </td>
	  <td><div>${b.board_name}</div></td>
	  <td><div>${b.board_date}</div></td>
	  <td><div>${b.board_readcount}</div></td>
	  </tr>
	  </c:forEach>
	  </tbody>
	 </table>
<!-- 페이징 -->
<div class="center-block">
	<ul class="commup justify-content-center">
  <c:if test="${page <= 1 }">
		<li class="page-item hovernone">
		 <a>&lt;</a>
		</li>
	  </c:if>
 	  <c:if test="${page > 1 }">
		<li class="page-item">
<a  href="Community.co?page=${page-1}&search_word=${search_word}"
		     >&lt;</a>
		</li>
	  </c:if>
	  
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
	   <c:if test="${a == page}">
		 <li class="page-item ">
			<a class="page-Link pageActive">${a}</a>
		 </li>
	   </c:if>
	   <c:if test="${a != page }"> 
	     <c:url var="go" value="Community.co">
	       <c:param name="search_word"  value="${search_word}" />
	       <c:param name="page"		    value="${a}" />
	     </c:url>
	 	 <li class="page-item">
			<a href="${go}" class="page-Link">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	 
<c:if test="${page >= maxpage }">
		<li class="page-item">
		 <a>&gt;</a>
		</li>
	  </c:if>
	  
 	  <c:if test="${page < maxpage }">
		<c:url var="go" value="Community.co">
	       <c:param name="search_word"  value="${search_word}" />
	       <c:param name="page"		    value="${page+1}" />
	     </c:url>
		<li class="page-item">
<a  href="Community.co?page=${page+1}&search_word=${search_word}">&gt;</a>
		</li>
	  </c:if>
	</ul>
<br>
</div>

<!-- 검색 폼 영역 -->
      <div class="my_search">
          <input id='mySearchinput' name="search_word" value="${search_word}"/>
          <button type='button' class='mySearch1'>검색</button>
      </div>	 

</c:if> <%--<c:if test="${listcount > 0}"> end --%>
<%--게시글이 없는 경우--%>
<c:if test="${listcount == 0 && empty search_word}">
  <h3 style="color:gray; text-align:center; margin:100px 0;">등록된 글이 없습니다.</h3>
</c:if>

<c:if test="${listcount == 0 && !empty search_word}">
  <h3 style="color:gray; text-align:center; margin:100px 0;">검색 결과가 없습니다</h3>
  </c:if>
<input type="submit" class="btn btn-primary pull-right" value="글쓰기">

</div>
</form>
<script>
//글쓰기는 로그인 후 가능
var sf = document.getElementById("comm");
sf.addEventListener("submit",function(e){
	var sin = document.getElementById("email");
	if(sin.value.length == 0){
		alert('로그인 후 이용 가능합니다.');
		e.preventDefault();
	}
})
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