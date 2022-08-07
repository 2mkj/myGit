<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 화면</title>
<jsp:include page="top.jsp"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
<style>
.container1{width:500px; margin:0 auto; margin-top:100px}
body > div.container1 > form > div > label {margin: 10px 0}
</style>
<script>
	$(function(){
		
		var result = '${login_result}';
		//result가 -1인 경우; //아이디는 일치하고 비밀번호가 일치하지 않는 경우
		//result가 0인 경우;  //아이디가 존재하지 않는 경우
		if(result != ''){
			if(result==='-1'){
				alert('비밀번호가 일치하지 않습니다.')
			}else{
				alert('아이디가 존재하지 않습니다.')
			}
			<%session.removeAttribute("login_result");%>
		}
		
		var id= '${id}';
		if(id){
			$("#id").val(id);
			$("#remember").prop('checked',true);
		}
})
</script>
</head>
<div class="container1">
 <form action="login_ok" method="post" class="border border-Light p-5">
 <p class="h4 mb-4 text-center">login</p>
 	<div class="form-group">
		<label for="id">id</label>
		<input type="text" class="form-control" id="id" placeholder="Enter id"
				name="id" required="required">
	</div>
	
	<div class="form-group">
		<label for="pass">Password</label>
		<input type="password" class="form-control" id="pass"
	   placeholder="Enter password" name="passwd" required="required">
	</div>

		<div class="form-group custom-control custom-checkbox">
           <input type="checkbox" class="custom-control-input" id="remember" name="remember" value="store">
           <label class="custom-control-label" for="remember">id 기억하기</label>
       </div>
       

	<button type="submit" class="btn btn-info my-4 btn-block">Submit</button>

</form>
</div>
</html>