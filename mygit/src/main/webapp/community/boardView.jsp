<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>무빗! - 커뮤니티 게시판</title>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.6.0.js"></script>
<jsp:include page="../mainpage/top.jsp" />
<link rel="stylesheet" href="css/view.css">
</head>
<body>
   <input type="hidden" id="loginid" value="${memberinfo.email}" name="loginid">
   <div class="container">
     <table class="table">
     	<tr>
     	  <th colspan="2">MVC 게시판-view페이지</th>
     	</tr>
     	<tr>
     	  <td><div>글쓴이</div></td>
     	  <td><div>${c.board_name}</div></td>
     	</tr>
     	<tr>
     	  <td><div>제목</div></td>
     	  <td><c:out value="${c.board_subject}" /></td>
     	</tr>
     	<tr>
     	 <td><div>내용</div></td>
		 <td style="padding-right: 0px">
		 <textarea class="form-control"
		           rows="5" readOnly>${c.board_content}</textarea></td>
	    </tr>
  <tr>
	<td colspan="2" class="center">
		<c:if test="${c.board_name == memberinfo.user_name || email == 'admin' }">
			<a href="CommunityModifyView.co?num=${c.board_num}">
			<button class="btn btn-info">수정</button>
			</a>
			<button class="deletechk btn btn-danger" onclick="location.href='CommunityDelete.co?num=${c.board_num}'">삭제</button>
		</c:if>
			<a href="Community.co">
			  <button class="btn btn-warning">목록</button>
			</a>
      </td>
  </tr>
 </table>
 <%--게시판 view end --%>

  <%-- Modal 시작 --%>
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      <%-- Modal body --%>
	<div class="modal-body">
    <form name="deleteForm" action="BoardDeleteAction.bo" method="post">
      <%--http://localhost:8088/Board/Board DetailAction.bo?num=22
						주소를 보면 num을 파라미터로 넘기고 있습니다.
						이 값을 가져와서 ${param.num}를 사용
						또는 ${c.board_num}
	  --%>
	<input type="hidden" name="num" value="${c.board_num}" id="comment_board_num">
	<div class="form-group">
		<label for="pwd">비밀번호</label>
		<input type="password"
			   class="form-control" placeholder="Enter password"
			   name="board_pass" id="board_pass">
	</div>
	<button type="submit" class="btn btn-primary">전송</button>
	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	</form>
   </div>
  </div>
 </div>
</div>
</div>
<script>
$(".deletechk").click(function () {
    var answer = confirm('정말 삭제하시겠습니까?');
    if (!answer) {// 취소를 클릭한 경우
		event.preventDefault(); //이동하지 않습니다.	    	
    }
});
</script>
</body>
</html>