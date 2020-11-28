<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pda.PdaDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="pda" class="pda.Pda" scope="page" />
<jsp:setProperty name="pda" property="pdaTitle" />
<jsp:setProperty name="pda" property="pdaContent" />
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
		PdaDAO pdaDAO = new PdaDAO();
		int numb = pdaDAO.getNext();
		String directory = "C:\\Users\\mhj96\\Desktop\\PDA-Web\\pdafile\\"+numb;
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
	
		MultipartRequest multipartRequest = new MultipartRequest(request, directory,
				maxSize, encoding, new DefaultFileRenamePolicy());
	
		request.setCharacterEncoding("euc-kr");
		String fileName = multipartRequest.getOriginalFileName("pdaFileName");
		String fileRealName = multipartRequest.getFilesystemName("pdaFileName");
		String pdaContent = multipartRequest.getParameter("pdaContent");
		String pdaTitle = multipartRequest.getParameter("pdaTitle");
		
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
			if (pdaTitle == null || pdaContent == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PdaDAO PdaDAO = new PdaDAO();
				int result = PdaDAO.write(pdaTitle, userID, pdaContent);
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
					script.println("location.href='pda.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>