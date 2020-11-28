<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ann.AnnDAO"%>
<%@ page import="ann.Ann"%>
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
		int annID = 0;
		if (request.getParameter("annID") != null) {
			annID = Integer.parseInt(request.getParameter("annID"));
		}
		if (annID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'ann.jsp'");
			script.println("</script>");
		}
		Ann ann = new AnnDAO().getAnn(annID);
		if (!userID.equals(ann.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'ann.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("annTitle") == null || request.getParameter("annContent") == null
					|| request.getParameter("annTitle").equals("") || request.getParameter("annContent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				AnnDAO annDAO = new AnnDAO();
				int result = annDAO.update(annID, request.getParameter("annTitle"), request.getParameter("annContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 성공했습니다')");
					script.println("location.href='ann.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>