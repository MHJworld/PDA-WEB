<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="annreply.ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="annreply" class="annreply.Reply" scope="page" />
<jsp:setProperty name="annreply" property="comment" />
<%
	System.out.println(annreply);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충북대학교 소프트웨어학과 PDA-Pro 동아리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String ident2 = request.getParameter("ident");
		int ident = Integer.parseInt(ident2);
		
		String addr1 = "location.href = 'viewann.jsp?annID=";
		String addr2 = "'";
		String addr = addr1 + ident + addr2;

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
		} else {
			if (annreply.getComment() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ReplyDAO ReplyDAO = new ReplyDAO();
				int result = ReplyDAO.write(ident, userID, annreply.getComment());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 성공했습니다')");
					script.println(addr);
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>