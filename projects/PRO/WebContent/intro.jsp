<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
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
						동아리 소개 및 수상내역			
					</h1>	
					<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href=""> Intro</a><span class="lnr lnr-arrow-right"></span> <a href="intro.jsp"> 동아리 소개 및 수상내역</a></p>
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->	

	<!-- Start info Area -->
	<section class="info-area pb-120">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-lg-6 no-padding info-area-left">
					<img class="img-fluid" src="img/i1.jpg" alt="">
				</div>
				<div class="col-lg-6 info-area-right">
					<h1>동아리 소개</h1>
					<p>놀 때도 미친듯이! 공부할 때도 미친듯이!</p>
					<br>
					<p>무조건 1등 하는 동아리!</p>
				</div>
			</div>
		</div>	
	</section>
	<!-- End info Area -->	

	<!-- Start course-mission Area -->
	<section class="course-mission-area pb-120">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-70 col-lg-8">
					<div class="title text-center">
						<h1 class="mb-10">동아리 수상내역</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 accordion-left">
					<!-- accordion 2 start-->
					<dl class="accordion">
						<dt>
							<a href="">2017년 수상내역</a>
						</dt>
						<dd>
							2017 한이음 공모전 입상<br>
							2017 'COURAGE' 소프트웨어 등록<br>
							2017 HCI 작품전시회 최우수상<br>
							2017 관광 스토리피칭콘테스트 최우수상<br>
							2017 창업 아이디어 경진대회 최우수상<br>
							2017 KDBC 논문 게재
						</dd>
						<dt>
							<a href="">2016년 수상내역</a>
						</dt>
						<dd>
							2016 교내 소프트웨어 경진대회 대상2, 우수상2 수상<br>
							2016 HCI작품 전시회 우수상2 수상<br>
							2016 정보콘텐츠특화프로그램 입상<br>
							2016 충청북도 앱 공모전 장려상
						</dd>
						<dt>
							<a href="">2015년 수상내역</a>
						</dt>
						<dd>
							2015 정보콘텐츠 소프트웨어 경진대회 장려상<br>
							2015 특허청장 10-2015-0154287 시그니터 모니터링 특허<br>
							2015 한이음 엑스포 공모전 입선<br>
							2015 창조경제 글로벌 정보콘텐츠 sw 인재양성 컨소시엄 경진대회 우수상<br>
							2015 제 4회 소프트웨어진대회(프로그래밍) 우수상<br>
							2015 제 4회 소프트웨어진대회(프로그래밍) 대상<br>
							2015 기술표준아이디어 공모전 기획부문 우수상
						</dd>
						<dt>
						<a href="">2014년 수상내역</a>
						</dt>
						<dd>
							2014 교내 소프트웨어경진대회 우수상, 장려상<br>
							2014 한국정보처리학회 추계학술발표대회 우수논문상<br>
							2014 충북 모바일앱 공모전 장려상<br>
							2014 HCI작품 전시회 최우수, 우수상 수상
						</dd>
					</dl>
				<!-- accordion 2 end-->
				</div>
				<div class="col-md-6 accordion-left">
					<!-- accordion 2 start-->
					<dl class="accordion">
						<dt>
							<a href="">2013년 수상내역</a>
						</dt>
						<dd>
							2013 연구동아리 제 2회 소프트웨어 경진대회 장려상 수상 "catch me"<br>
							2013 연구동아리 제 2회 소프트웨어 경진대회 우수상 수상 "키드럼"<br>
						</dd>
						<dt>
							<a href="">2012년 수상내역</a>
						</dt>
						<dd>
							2012 연구동아리 제 1회 소프트웨어 경진대회 장려상 수상 "절대음감(악보표출프로그램)"
						</dd>
						<dt>
							<a href="">2011년 수상내역</a>
						</dt>
						<dd>
							2011 창업동아리 경진대회 최우수상 수상 "모바일 메신져"<br>
							2011 창조캠퍼스 활동 "스마트폰 지식in"
						</dd>
						<dt>
							<a href="">~2010년 수상내역</a>
						</dt>
						<dd>
							2009 BK21 IT-Festival 연구동아리 전시 장애인 Assistant System<br>
							2008 BK21 IT-Festival 연구동아리 전시 RFID 냉장고 시스템<br>
							2006 SIP-PDA 인터넷폰 개발<br>
							2005 PDA E-Learning 시스템 개발 완료<br>
							2005 제2회 컴퓨터 전공배 소프트웨어 경진대회 최우수상 수상<br>
							2005 Brew 핸드폰용 3D 모바일 볼링 게임 개발 완료<br>
							2005 PDA-PC 네트워크 퍼즐버블버블 게임 개발 완료<br>
							2004 제1회 컴퓨터 전공배 소프트웨어진흥대회 대상 수상
						</dd>
					</dl>
					<!-- accordion 2 end-->
				</div>
			</div>
		</div>	
	</section>
	<!-- End course-mission Area -->			    			

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