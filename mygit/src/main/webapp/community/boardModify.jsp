<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>MVC 게시판</title>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../mainpage/top.jsp" />
<style>
  h1{font-size:1.5rem; text-align: center; color: #1a92b9}
  #upfile{display:none}
  input:focus, textarea:focus{outline: 1px solid red;}
</style>
</head>
<body>
<%--게시판 수정 --%>
<div class="container">
 <form action="CommunityModify.co" method="post" name="modifyform">
  <input type="hidden" name="num" value="${c.board_num}">
  <h1>MVC 게시판 - 수정</h1>
  <div class="form-group">
   <label for="board_name">글쓴이</label>
   <input type="text" class="form-control" name="name"  value="${c.board_name}" readOnly>
  </div>
  <div class="form-group">
	<label for="board_subject">제목</label>
	<textarea name="subject" id="board_subject"  rows="1" maxlength="100"
		   class="form-control">${c.board_subject}</textarea>
  </div>
  <!-- Cross-Site Scripting 
  악의적으로 사용자가 공격하려는 사이트에 스크립트를 넣는 기업이며
  공격에 성공하면 사이트에 접속한 사용자는 삽입된 코드를 실행하게 되면서 의도치 않은 행동을 수행시킵니다.
  
  *해결방법
  1. textarea태그에 출력하는 경우 text로 처리해 스크립트가 실행되지 않습니다.
  2. 코어 라이브러리 이용하는 경우
  	 <c:out value="${b.BOARD_SUBJECT}" escapeXml="true"/>
  	 escapeXml="true" 옵션을 이용해서 HTML 태그를 화면에 그대로 보여주게 합니다.
  3. 자바스크립트의 replace를 이용하는 방법
  4. 입력된 데이터의 "<", ">"를 특수문자로 변경합니다.
     //크로스 사이트 스크립팅 방지하기 위한 메서드
     private String replaceParameter(String param){
     	String result = param;
     	if(param !=null){
     		result = result.replaceAll("<","&lt;");
     		result = result.replaceAll(">","&gt;");
  		}
  		return result;
  	}
  -->
  <div class="form-group">
	<label for="board_content">내용</label>
	<textarea name="content" id="board_content"
			  rows="15" class="form-control">${c.board_content}</textarea>
  </div>
   
  <div class="form-group">
  	<button type="submit" class="btn btn-primary">수정</button>
  	<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
  </div>
  </form>
 </div><%--class="container" end --%>
</body>
</html>