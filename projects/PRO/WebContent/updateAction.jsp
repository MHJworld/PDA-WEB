<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pda.PdaDAO"%>
<%@ page import="pda.Pda"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int pdaID = 0;
		if (request.getParameter("pdaID") != null) {
			pdaID = Integer.parseInt(request.getParameter("pdaID"));
		}
		if (pdaID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'pda.jsp'");
			script.println("</script>");
		}
		Pda pda = new PdaDAO().getPda(pdaID);
		if (!userID.equals(pda.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'pda.jsp'");
			script.println("</script>");				
		} else {
			if (request.getParameter("pdaTitle") == null || request.getParameter("pdaContent") == null
					|| request.getParameter("pdaTitle").equals("") || request.getParameter("pdaContent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PdaDAO pdaDAO = new PdaDAO();
				int result = pdaDAO.update(pdaID, request.getParameter("pdaTitle"), request.getParameter("pdaContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='pda.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>