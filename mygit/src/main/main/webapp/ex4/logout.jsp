<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>�α��μ���</title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<script>
		alert("�α׾ƿ� �Ǿ����ϴ�.");
		location.href = 'main.jsp'
	</script>
</html>
