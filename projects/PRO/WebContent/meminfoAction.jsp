<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pda.PdaDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="pda" class="pda.Pda" scope="page" />
<%
	System.out.println(pda);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충북대학교 소프트웨어학과 PDA-Pro 동아리</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (session.getAttribute("userID") != null && userID.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'meminfo.jsp'");
			script.println("</script>");
		} else if (session.getAttribute("userID") != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자가 아닙니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인하세요')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>