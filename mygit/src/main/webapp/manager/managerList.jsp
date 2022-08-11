<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.js"></script>
 <jsp:include page="../mainpage/top.jsp" />  
 <%--
 1. 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다.
 
 2. 검색 필드를 변경하면 검색어 입력창에 placeholder 나타나도록 합니다.
    예로 아이디를 선택하면 placeholder로 "아이디 입력하세요"라고 나타납니다.
    예로 이름을 선택하면 placeholder로 "이름 입력하세요"라고 나타납니다.
    예로 나이를 선택하면 placeholder로 "나이 입력하세요"라고 나타납니다.
    예로 성별을 선택하면 placeholder로 "여 또는 남 입력하세요"라고 나타납니다.
    
 3. 검색 버튼 클릭시 다음을 체크합니다.
 	1) 검색어를 입력하지 않은 경우 "검색어를 입력하세요" 라고 대화상자가 나타나게 합니다.
 	2) 나이는 두 자리 숫자가 아닌 경우 "나이는 형식에 맞게 입력하세요(두자리 숫자)" 라고 대화상자가 나타나게 합니다.
 	3) 성별은 "남" 또는 "여"가 아닌 경우 "남 또는 여를 입력하세요" 라고 대화상자가 나타나게 합니다.
 	
 4. 회원 목록의 삭제를 클릭한 경우
 	confirm("정말 삭제하시겠습니까?")를 실행해서 취소를 클릭하면 "memberDelete.net"로 이동하지 않습니다. 
  --%>
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
<script>
  $(function(){
  		// 검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
  		var selectedValue = '${search_field}';
  		if(selectedValue != -1)
  			$("#viewcount").val(selectedValue);
 
  		var word = $(".input-group input").val();
  			if(selectedValue == 2){
  				pattern = /^[0-9]{2}$/;
  				if(!pattern.test(word)){
  					alert("나이는 형식에 맞게 입력하세요(두자리 숫자)");
  					return false;
  				}
  			}else if(selectedValue == 3){
  				if(word != "남" && word != "여"){
  					alert("남 또는 여를 입력하세요");
  					return false;
  				}
  			}
  		// 검색어 입력창에 placeholder 나타나도록 합니다.
  		$("#viewcount").change(function(){
  			selectedValue = $(this).val();
  		$("input").val('');
  		message = ["아이디", "이름","나이", "여 또는 남"];
  		$("input").attr("placeholder", message[selectedValue] + " 입력하세요");
  	})// $("#viewcount").change end
  	
  	// 회원 목록의 삭제를 클릭한 경우
 	$(".deletechk").click(function () {
    var answer = confirm('정말 삭제하시겠습니까?');
    if (answer == true) {
    	$(location).attr('href','managerDelete.mg?email=${m.email}');
    }
	});// 삭제 클릭 end
})	//ready end
  </script>
 <style>

</style>
 <title>MVC 게시판</title>
</head>
<body>
 <div id="layoutSidenav">
   <div id="layoutSidenav_nav">
     <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
       <div class="sb-sidenav-menu">
         <div class="nav">
		   <div class="sb-sidenav-menu-heading">회원 관리</div>
           <a class="nav-link" href="managerInfo.mg?email=${m.email }">회원 정보 관리</a>                        
           <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
             <br></a>
           <div class="sb-sidenav-menu-heading">게시판</div>
           <a class="nav-link" href="BoardList.boo">게시판 관리</a>                        
           <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
             <br></a>
		   <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth"></a>
			<div class="nav">
               <div class="sb-sidenav-menu-heading"></div>
               <a class="nav-link" href="#"></a>
	               <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
	                   </a>
	             <a class="nav-link" href="#"></a>
	               <a class="nav-link collapsed" href="Footer.jsp" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
	                 </a>
			 </div> 
			   
               <div class="nav">
                <div class="sb-sidenav-menu-heading">영화 목록</div>
                 <a class="nav-link" href="/moviepage/newmovie.jsp"> 최신 영화</a>
                 <a class="nav-link" href="popularitymovie.jsp"> 인기 영화</a>
                           
                 <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
	                 <a class="navbar-brand" href="main.net" style="text-align:center;">무빗!</a>
	      			 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
	        		 	<span class="navbar-toggler-icon"></span>
	     			 </button>  
                 </a>
                 </div>
                 <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="401.html">401 Page</a>
                    <a class="nav-link" href="404.html">404 Page</a>
                    <a class="nav-link" href="500.html">500 Page</a>
                  </nav>
                </div>
              </nav>
            </div>
            
                     
	<div class="container">  
	 	<form action="managerList.mg" method="post">
	 		<div class="input-group">
 				<select id="viewcount" name="search_field">
				  <option value="0" selected>아이디</option>
				  <option value="1">이름</option>
				  <option value="2">나이</option>
				  <option value="3">성별</option>
	 			</select>
 				<input name="search_word" type="text" class="form-control"
 						placeholder="아이디 입력하세요" value="${search_word}">
 				<button class="btn btn-primary" type="submit">검색</button>
	 		</div>
	 	</form>
	 	<c:if test="${listcount > 0}">
	 	<%-- 회원이 있는 경우 --%>
	 		<table class="table table-striped">
	 			<caption style="font-weight: bold">회원 목록</caption>
	 			<thead>
	 				<tr>
	 					<th colspan="2">회원 정보 list</th>
	   					<th><font size=3>회원 수 : ${listcount}</font></th>
	   				</tr>
	   				<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>삭제</td>
					</tr>
				</thead>	
	 		
	 		<tbody>
				<c:forEach var="m" items="${totallist}">
					<tr>
						<td><a href="managerInfo.mg?id=${m.email}">${m.email}</a></td>
						<td>${m.name}</td>
						<td><button type="button" class="deletechk btn btn-danger">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	<div>
		  <ul class="pagination justify-content-center">		
			 <c:if test="${page <= 1 }">
				<li class="page-item">
				  <a class="page-link gray">이전&nbsp;</a>
				</li>
			 </c:if>
			 <c:if test="${page > 1 }">			
				<li class="page-item">
   <a href="managerList.net?page=${page-1}&search_field=${search_field}&search_word=${search_word}" 
				      class="page-link">이전&nbsp;</a>
				</li> 
			 </c:if>
					
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page}">
					<li class="page-item active" >
					   <a class="page-link">${a}</a>
					</li>
				</c:if>
				<c:if test="${a != page }">
					<c:url var="go" value="managerList.mg">
						<c:param name="search_field"  value="${search_field}"/>
						<c:param name="search_word"   value="${search_word}"/>
						<c:param name="page"          value="${a}"/>
					</c:url>
				    <li class="page-item">
					   <a href="${go}" class="page-link">${a}</a>
				    </li>	
				</c:if>
			</c:forEach>
			
			<c:if test="${page >= maxpage }">
				<li class="page-item">
				   <a class="page-link gray">&nbsp;다음</a> 
				</li>
			</c:if>
			<c:if test="${page < maxpage }">
					<c:url var="next" value="managerList.mg">
						<c:param name="search_field"  value="${search_field}"/>
						<c:param name="search_word"   value="${search_word}"/>
						<c:param name="page"          value="${page+1}"/>
					</c:url>
					  <li class="page-item">
						<a href="${next}" class="page-link">&nbsp;다음</a>
					  </li>	
				</c:if>
		 	</ul>
		</div>
	 </c:if>
	</div>
		
	 <%-- 회원이 없는 경우--%>
	 <c:if test="${listcount == 0 && empty search_word}">
		<h1>회원이 없습니다.</h1>
	 </c:if>
	 
	 <c:if test="${listcount == 0 && !empty search_word}">
		<h1>검색 결과가 없습니다.</h1>
	 </c:if>

</body>
</html>