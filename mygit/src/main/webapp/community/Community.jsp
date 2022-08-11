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
<form id="comm" method="post" action="Community.co">
<input type="hidden" id="email" name="email" value="${memberinfo.email}">
<div class="container community1">
<div class="cobanner" onclick="window.open('https://www.biff.kr/kor/')" style="cursor:pointer; text-align:center;">
	<img style="border-radius:20px;" src="image/mymainimg/busan.png"></div>
<table class="table commut">
<!-- 테이블 간격 -->
<colgroup>
<col width="10%" />
<col width="60%" />
<col width="12%" />
<col width="10%" />
<col width="8%" />
</colgroup>
<!-- 게시판 내용 -->
 <thead>
   <tr>
     <th colspan="4">
      <img src="${pageContext.request.contextPath}/image/mymainimg/commu.png" width=32 height=32 id="commu_icon">
      커뮤니티 게시판</th>
     <th><button type="button" class="cowrt button-5 pull-right">글쓰기</button></th>
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
    <%-- 게시글이 있는 경우 --%>
<c:if test="${listcount > 0 }">
     <c:set var="num" value="${listcount-(page-1)*limit}" />
     <c:forEach var="b" items="${boardlist}">
     
     <tr>
      <td><%-- 번호 --%>
       <c:out value="${num}"/><%--출력 --%>
       <c:set var="num" value="${num-1}" /> <%--num=num-1;의미 --%>
	  </td>
	 <td><%--제목 --%>
	  <div>
	  
	  <input type="hidden" id="board_name" name="board_name" value="${b.board_name}">
	  
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
	  <td><div title="게시글 보기" class="userdoc" style="cursor:pointer">${b.board_name}</div></td>
	  <td><div>${b.board_date}</div></td>
	  <td><div>${b.board_readcount}</div></td>
	  </tr>
	  </c:forEach>
</c:if> <%--<c:if test="${listcount > 0}"> end --%>
<%--게시글이 없는 경우--%>
<c:if test="${listcount == 0 && empty search_word}">
  <td colspan="5"><h2 style="color:gray; text-align:center; margin:100px 0;">등록된 글이 없습니다.</h2>
  </td>
</c:if>

<c:if test="${listcount == 0 && !empty search_word}">
   <td colspan="5">
  <h2 style="color:gray; text-align:center; margin:100px 0;">검색 결과가 없습니다</h2>
  </td>
  </c:if>
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
      <select id="viewcount" name="search_field">
		<option value="0" selected>제목+내용</option>	
		<option value="1">제목</option>
		<option value="2">내용</option>
	  </select>
        <input id='mySearchinput' name="search_word" value="${search_word}"/>
        <button type='submit' class='mySearch1'>검색</button>
   </div>	 


</div>
</form>
<!-- 하단 -->
<jsp:include page="../mainpage/upup.jsp"/>
<footer>
	<jsp:include page="../mainpage/bottom.jsp"/>
</footer>

<script>
$(function(){
	//로그인 후 글쓰기 가능
	$(".cowrt").click(function () {
	    if (document.getElementById("email").value.length == 0) {
	    	alert("로그인 후 이용 가능합니다.")
	    }else{
	    	$(location).attr('href','CommunityWrite.co');
	    }
	});
	
	//해당 글쓴이가 작성한 다른 글 보기
	$(".userdoc").click(function () {
		var url = "UserView.co?board_name="+$(this).text();
		var name = "게시글 보기"
		var option = "width=650,height=525,top=100,left=200,location=no,";
	 	window.open(url,name,option);
	});
	
	//검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
	var selectedValue = '${search_field}'
	if (selectedValue != '-1')
		$("#viewcount").val(selectedValue);
	
	//검색 버튼 클릭한 경우
	$(".mySearch1").click(function(){
		//검색어 공백 유효성 검사합니다.
		if($("#mySearchinput").val() == ''){
			alert("검색어를 입력하세요");
			$("#mySearchinput").focus();
			return false;
		}
		var email = $("#email").val();
	}); //button click end
	
	//검색어 입력창에 placeholder 나타나도록 합니다.
	$("#viewcount").change(function(){
		selectedValue = $(this).val();
		$("#mySearchinput").val('');
		message = ["제목+내용","제목", "내용"]
		$("#mySearchinput").attr("placeholder", message[selectedValue] + " 입력하세요");
	})//$("#viewcount") change end
})//ready end
</script>
</body>
</html>