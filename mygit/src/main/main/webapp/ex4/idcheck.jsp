<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>idcheck.jsp</title>
<script src="http://code.jquery.com/jquery-Latest.js"></script>
</head>
<body>
<div id=message></div>
<button>�ݱ�</button>
<script>
var message=["������� ���̵� �Դϴ�.","��밡���� ���̵� �Դϴ�."];
var color=["red", "green"];
var index=${result + 1};
$("#message").text(message[index]).css('color', color[index]);

$("button").click(function(){
	$(opener.document).find("#opener_message")
					  .text(message[index]).css('color', color[index]);
	$(opener.document).find("#result").val('${result}');
	window.close();
})
</script>
</body>
</html>