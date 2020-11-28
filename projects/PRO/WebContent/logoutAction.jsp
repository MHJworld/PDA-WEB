<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충북대학교 소프트웨어학과 PDA-Pro 동아리</title>
</head>
<body>
	<%
			session.invalidate();
	%>
	<script>
		alert('로그아웃에 성공했습니다.');
		location.href = 'index.jsp';
	</script>
</body>
</html>