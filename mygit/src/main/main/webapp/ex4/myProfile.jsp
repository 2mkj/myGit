<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>프로필 수정</title>
<jsp:include page="top.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* 드롭다운메뉴 맨위로 */
.header {position:relative;z-index:2; margin:0;padding:0;} 

.col-md-7{margin-top:60px;width:28%}
.col-md-5{margin-top:60px;width:700px;height:1000px;}

footer {
  bottom: 0px;
  height: 3rem;
  background-color: #ccc;
  width: 100%;
  text-align: center;
  line-height: 3rem;
  }
</style>
</head>
<body>
<div class="header">

</div>
<div class="container">
<div class="wrap">
    <div class="row featurette">
      
      <div class="col-md-7">
        <jsp:include page="sidebar.jsp"/>
      </div>
      
      <div class="col-md-5">
       <div><h2 id="profile_modify">프로필 수정</h2></div>
        <hr class="featurette-divider">
			
<c:if test="${!empty temp}">
   <form name="myform" method="post" action="update" class="modal-content" id="myform">
	<div class="container">
	<fieldset>
	<legend>정보 수정</legend>
	<label for="id">ID</label>
	<div>
	<input type="text" 
		   placeholder="Enter id" name="id" id="id" readOnly
		   value="${temp.id}" style="background: #ccc; width: 100%">
	</div>
	
	<label for="pass">Password</label>
	<input type="password" placeholder="Enter Password" name="pass" id="pass"
	value='${temp.password}'>
<br>
	 <label for="jumin1">주민번호</label>
	<input type="text" placeholder="주민번호 앞자리" maxLength="6"
			name="jumin1" id="jumin1" value="${temp.jumin.substring(0,6)}">
	<b> - </b>
	<input type="text" placeholder="주민번호 뒷자리" maxlength="7" 
			name="jumin2" id="jumin2" value="${temp.jumin.substring(7)}">
 <br>      
 	<label for="email">E-Mail</label>
	<input type="text" name="email" id="email" value="${temp.email.split('@')[0]}"> @
	<input type="text" name="domain" id="domain" value="${temp.email.split('@')[1]}">
<br> 
	<select name="sel" id="sel" >
	<option value="">직접입력</option>
	<option value="naver.com">naver.com</option>
	<option value="daum.net">daum.net</option>
	<option value="nate.com">nate.com</option>
	<option value="gmail.com">gmail.com</option>
	</select>
<br>	
	<label>성별</label>
	<div class="container2">
	<input type="radio" name="gender" value="m" id="gender1" >남자
	<input type="radio" name="gender" value="f" id="gender2" >여자
	</div>
		<label for="post1">우편번호</label>
		<input type="text" size="5" maxlength="5" name="post1" id="post1" value="${temp.post}" readOnly>
		<input type="button" value="우편검색"  id="postcode">
<br>		
		<label for="address">주소</label>
		<input type="text" size="50" name="address" id="address" value="<c:out value='${temp.address}'/>">
<br>		
		<div class="clearfix">
      <button type="submit" class="signupbtn">수정</button>
      <button type="reset" class="cancelbtn">취소</button>
      </div> 
     </fieldset>
     </div>
   </form>
 <script>
   var gender = '${temp.gender}';
   $("input[value="+gender+"]").prop("checked",true); // 성별체크
   
   //체크되지 않는 성별을 비활성 시켜 임의로 선택할 수 없도록 합니다.
   $("input:radio").not(":checked").prop("disabled",true);
   
   var hobbys = '${temp.hobby}'.split(',');
   for (var i = 0; i < hobbys.length; i++)
	   $("input[value="+hobbys[i]+"]").prop("checked",true)
 </script>
		</c:if>
		<c:if test="${empty temp}">
		<h3 style="text-align:center; position:relative; top:3em;">조회된 데이터가 없습니다.</h3>
		</c:if>

      </div>
    </div>
  </div>
</div>

<!-- 하단 -->
<footer>
	<jsp:include page="bottom.jsp"/>
</footer>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

</body>
</html>