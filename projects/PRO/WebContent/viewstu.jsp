<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import ="java.io.File" %>
<%@ page import="stu.Stu"%>
<%@ page import="stu.StuDAO"%>
<%@ page import="stureply.Reply"%>
<%@ page import="stureply.ReplyDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="colorlib">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta charset="UTF-8">

	<title>충북대학교 소프트웨어학과 PDA-Pro 동아리</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int stuID = 0;
		if (request.getParameter("stuID") != null) {
			stuID = Integer.parseInt(request.getParameter("stuID"));
		}
		if (stuID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'stu.jsp'");
			script.println("</script>");
		}
		Stu stu = new StuDAO().getStu(stuID);
	%>
	<header id="header" id="home">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-8 header-top-left no-padding"></div>
					<div class="col-lg-6 col-sm-6 col-4 header-top-right no-padding">
						<a href="#"><span class="lnr lnr-phone-handset"></span> <span class="text">
						<%
							if (userID == null) {
						%>로그인을 해주세요!</span></a>
						<%
						} else {
						%>
						<%=userID %>님 환영합니다!</span></a>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	    <div class="container main-menu">
	    	<div class="row align-items-center justify-content-between d-flex">
		    	<div id="logo">
		        	<a href="index.jsp"><img src="img/logo.png" alt="" title=""/></a>
		      	</div>
		      	<nav id="nav-menu-container">
		        	<ul class="nav-menu">
		          		<li><a href="index.jsp">Home</a></li>
				  		<li class="menu-has-children"><a href="">Intro</a>
						<ul>
							<li><a href="intro.jsp">동아리 소개 및 수상내역</a></li>
							<li><a href="intro2.jsp">임원진 소개</a></li>
							<li><a href="intro3.jsp">동아리방 소개</a></li>
					  	</ul>
				  		</li>
				  		<li class="menu-has-children"><a href="">Member</a>
							<ul>
								<li><a href="member20.jsp">20학번</a></li>
								<li><a href="member19.jsp">19학번</a></li>
								<li><a href="member18.jsp">18학번</a></li>
								<li><a href="member17.jsp">17학번</a></li>
								<li><a href="member16.jsp">16학번</a></li>
								<li><a href="member15.jsp">15학번</a></li>
								<li><a href="member14.jsp">~14학번</a></li>
					  		</ul>
				  		</li>
				  		<li><a href="ann.jsp">NOTICE</a></li>
				  		<li><a href="stu.jsp">STUDY</a></li>
				  		<li class="menu-has-children"><a href="">COMMUNITY</a>
							<ul>
								<li><a href="http://club.cyworld.com/ClubV1/Home.cy/51778067" target="_blank">구 홈페이지</a></li>
								<li><a href="pda.jsp">자유게시판</a></li>
					  		</ul>
				  		</li>
				  		<li><a href="contact.jsp">CONTACT</a></li>
				  		<li><a href="meminfoAction.jsp">ADMIN</a></li>
				  		<%
					if (userID == null) {
						%>
						<li class="menu-has-children"><a href="">Guest</a>
							<ul>
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
							</ul>
						</li>
						<%
					} else {
						%>
						<li class="menu-has-children"><a href="">Login</a>
							<ul>
								<li><a href="logoutAction.jsp">로그아웃</a></li>
							</ul>
						</li>
						<%
					}
						%>
		        	</ul>
		      	</nav>
	    	</div>
	    </div>
	</header><!-- #header -->
	
	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						공모전
					</h1>
					<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="stu.jsp">공모전</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	
<br><br><br>
	
	<!-- Start board Area -->
	<div class="container">
		<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%= stu.getStuTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= stu.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="2"><%= stu.getStuDate().substring(0, 11) + stu.getStuDate().substring(11, 13) + "시"
							+ stu.getStuDate().substring(14, 16) + "분"%></td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= stu.getStuContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td>첨부파일</td>	
							<td>
								<%
									StuDAO stuDAO = new StuDAO();
									String directory = "C:\\Users\\mhj96\\Desktop\\PDA-Web\\stufile\\"+stuID;/*application.getRealPath("/upload");*/
									String files[] = new File(directory).list();
		
									for(String file : files) {
										out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
										java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br>");
									}
								%>
							</td>
						</tr>
					</tbody>
				</table>	
				<a href = "stu.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(stu.getUserID())){
				%>
						<a href="updatestu.jsp?stuID=<%= stuID %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deletestuAction.jsp?stuID=<%= stuID %>" class="btn btn-primary">삭제</a>
				<%					
					}
				%>
		</div>
	</div>
	<!-- End board Area -->
	
	<br><br>
	
	<!-- Start reply Area -->
	<div class="container">
		<div class="row">
			<form method="post" action="writestuReplyAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; width: 1125px">
					<tbody>
						<tr>
							<td><input type="hidden" name="ident" value=<%= stuID%>></td>
							<td colspan="2"><input type="text" class="form-control" placeholder="댓글 내용" name="comment" maxlength="128"></td>
							<td><input type="submit" class="btn btn-info pull-right" value="댓글쓰기" /></td>
						</tr>
						<%
						ReplyDAO replyDAO = new ReplyDAO();
						ArrayList<Reply> list = replyDAO.getList(stuID);
						for(int i = 0; i < list.size(); i++) {
						%>
						<tr>
					 		<td><%= list.get(i).getUserID() %></td>
					 		<td colspan="2"><%= list.get(i).getComment() %></td>
							<td><%= list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시" + list.get(i).getDate().substring(14, 16) + "분" %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!-- Start reply Area -->
	
<br><br><br>
	
	<!-- start footer Area -->
	<footer class="footer-area section-gap" style="padding-top: 0px; padding-bottom: 20px;">
		<div class="container">
			<div class="footer-bottom row align-items-center justify-content-between">
				<p class="footer-text m-0 col-md-12">
					<a href="tel:+82 010 2061 6218"><span class="lnr lnr-phone-handset"></span> <span class="text">TEL. 010 2061 6218</span></a>
					 | 청주시 흥덕구 개신동 충북대학교 S4-1 116호<br>
					동아리 대표: 박신형 | 1차 제작: 문학준, 안태환, 정대환 | 2차 제작: 문학준, 안태환, 박혜영<br>
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> © www.pda-pro.com All rights reserved</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

<br><br><br>

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9CjgE06ZmMPZucs0xcRhWCjj9TiGV5ds&callback=myMap"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.tabs.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>