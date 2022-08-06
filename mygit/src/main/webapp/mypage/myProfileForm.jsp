<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>프로필 수정</title>
<link href="css/my.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.6.0.js"></script>
<style>
input[type=file]{
	display:none;
}
</style>
</head>
<body class="updatebody">
   <form class="update" name="updateform" method="post" enctype="multipart/form-data">
	<h3>프로필 수정</h3>
	<hr>
	<table class="updatep">
	<tr>
	<td>E-Mail</td>
	<td>admin3@gamil.com</td> 
	
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pass" value="${memberinfo.password}"></td>
	</tr>
	<tr>
	<td>비밀번호 확인</td>
	<td><input type="password" name="passcheck" value="${memberinfo.password}"></td>
	</tr>
	
	<tr>
	<td>닉네임</td>
	<td><input type="text" name="id" value="${memberinfo.id}"></td>
	</tr>
	
	<tr>
	<td>이름</td>
	<td>김유저</td>
	</tr>
	
	<tr>
	<td>주민번호</td>
	<td>
	990909-3******
	</td>
	</tr>
	
	<tr>
	 <td>성별</td>
	<td><div class="container2">
	<input type="radio" name="gender" value="남">&ensp;남자
	&emsp;&emsp;
	<input type="radio" name="gender" value="여">&ensp;여자
	</div>
	</td>
	</tr>
	
	<tr>
	<td>전화번호</td>
	<td><input type="text" name="id" value="010-1234-5678"></td>
	</tr>
	
	<tr>
	<td>우편번호</td>
	<td><input type="text" size="5" maxlength="5" name="post" id="post" value="123" readOnly>
	<input class="button-5 postb" type="button" value="우편검색"  id="postcode">
	</td>
	</tr>
	<tr>
	<td>주소</td>
	<td>
	 <input type="text" size="50" name="address" id="address" value="<c:out value='123'/>">
	</td>
	</tr>
	<tr>
	<td>프로필 사진</td>
	<td>
	<label>
	  <img src="image/attach.png" width="20px">
	  <span id="filename">${memberinfo.memberfile}</span>
	  <span id="showImage">
	    <c:if test='${empty memberinfo.memberfile}'>
	     <c:set var='src' value='image/profile.png'/>
	    </c:if>
	    <c:if test= '${!empty memberinfo.memberfile}'>
	     <c:set var='src' value='${"memberupload/"}${memberinfo.memberfile}'/>
	    </c:if>
		<img class="profilep" src="${src}" width="20px" alt="profile">
		</span>
		<%--accept: 업로드할 파일 타입을 설정합니다.
		  <input type="file" accept="audio/* | video/* image/*">
			(1) 파일 확장자는 .png, jpg, .pdf, .hwp 처럼 (.)으로 시작되는 파일 확장자를 의미합니다.
							예)accept=".png, jpg, .pdf, .hwp"
			(2) audio/* : 모든 타입의 오디오 파일
			(3) image/* 모든 타입의 이미지 파일
	--%>		

	<input type="file" name="memberfile" accept="image/*">
</label>
	</td>
	</tr>
	</table>
	<div class="mybutton">
	<button class="button-5 updateb">수정</button>
	<button class="button-5 signoutb">탈퇴</button>
	</div>
	</form>
	
	
<script>
$(".updateb").click(function () {
    $("form").attr("action", "updateProfile.net");
});

$(".signoutb").click(function () {
    var answer = confirm('정말 탈퇴하시겠습니까?');
    if (!answer) {// 취소를 클릭한 경우
		event.preventDefault(); //이동하지 않습니다.	    	
    }else{
      $("form").attr("action", "signout.net?id=${id}");
    }
});

	//성별 체크해주는 부분	
   $("input[value='${memberinfo.gender}']").prop("checked",true);
   
   $("input:file").change(function() {
	var inputfile = $(this).val().split('\\');
	var filename = inputfile[inputfile.length - 1];
	
	var pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
	
	if(pattern.test(filename)){
		$('#filename').text(filename);
		
		var reader = new FileReader(); // 파일을 읽기 위한 객체 생성
		//DataURL 형식(접두사 data:가 붙은 URL이며 바이너리 파일을 Base64로 인코딩하여 ASCI문자열 형식으로 변환 것)으로
		//파일을 읽어옵니다. (참고-Bast64 인코딩은 바이너리 데이터를 Text로 변경하는 Encoding입니다.)
		//네트워크탭에서 실행 후 Headers 확인해 보세요
		
		//읽어온 결과는 reader객체의 result 속성에 저장됩니다.
		//event.target.files[0] : 선택한 그림의 파일객체에서 첫번째 객체를 가져옵니다.
		reader.readAsDataURL(event.target.files[0]);
		
		reader.onload = function(){//읽기에 성공했을 때 실행되는 이벤트 핸들러
		// $('#showImage').html('<img width="20px" src="'+ this.result +'">');
		$('#showImage > img').attr('src',this.result);
		};
	}else{
		alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
		$('#filename').text('');
		$('#showImage > img').attr('src','image/profile.png');
		$(this).val(''); //안하면 내가 선택한 파일이 올라가버림
	}
  });//change()
  
</script>
</body>
</html>