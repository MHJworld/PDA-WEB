<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor" class="no-js">
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
						충북대학교 소프트웨어학과 PDA-Pro 동아리
					</h1>
					<p></p><br>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start feature Area -->
	<section class="feature-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="single-feature">
						<div class="title">
							<h4>동아리 소개</h4>
						</div>
						<div class="desc-wrap">
							<p>
								PDA-pro 동아리 소개 및 수상내역
							</p>
							<a href="intro.jsp">바로가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature">
						<div class="title">
							<h4>공지사항</h4>
						</div>
						<div class="desc-wrap">
							<br><br>
							<a href="ann.jsp">바로가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature">
						<div class="title">
							<h4>자유게시판</h4>
						</div>
						<div class="desc-wrap">
							<br><br>
							<a href="pda.jsp">바로가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End feature Area -->

	<!-- Start popular-course Area -->
	<section class="popular-course-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-70 col-lg-8">
					<div class="title text-center">
						<h1 class="mb-10">동아리 수상내역</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-popular-carusel">
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/ha.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 한이음 공모전 입상
								</h4>
							</a>
							<p>
								대학생(멘티)이 ICT기업전문가(멘토)와 팀을 이루어 프로젝트를 수행함으로서 ICT실무역량을 향상 시키는 대한민국 ICT분야 대표 멘토링 프로그램에서 입상을 했다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/sw.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 'COURAGE' 소프트웨어 등록
								</h4>
							</a>
							<p>
								PDA동아리원들끼리 만든 COURAGE 소프트웨어를 성공적으로 런칭하였다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/hc.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 HCI 작품전시회 최우수상
								</h4>
							</a>
							<p>
								국민편익증진(QoLT) HCI 공모전에서 최우수상을 받으며 PDA 동아리의 우수성을 알렸다. 
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/pc.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 관광 스토리피칭콘테스트 최우수상
								</h4>
							</a>
							<p>
								'어느날 청남대에서'라는 내가 대통령이 되어 간단한 스토리를 즐기며 청남대 구석구석 VR로 체험할 수 있는 콘텐츠로 매우 우수한 성적을 거두었다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/ha.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 창업 아이디어 경진대회 최우수상
								</h4>
							</a>
							<p>
								SW중심사업단에서 개최한 창업 아이디어 경진대회에서 최우수상을 차지하였다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/no.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2017 KDBC 논문 개제
								</h4>
							</a>
							<p>
								한국정보과학회 데이터베이스 소사이어티에서 개최한 학술대회에서 우수 논문으로 선정되었다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/4w.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2016 교내 소프트웨어 경진대회 대상2, 우수상2 수상
								</h4>
							</a>
							<p>
								매년 치뤄지는 교내 소프트웨어 경진대회에서 우수한 성적을 거두었다.
							</p>
						</div>
					</div>
					<div class="single-popular-carusel">
						<div class="thumb-wrap relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="img/index/hc.jpg" alt="">
							</div>
						</div>
						<div class="details">
							<a href="#">
								<h4>
									2016 HCI 작품전시회 우수상 2
								</h4>
							</a>
							<p>
								국민편익증진(QoLT) HCI 공모전에서 우수상 2개를 받으며 PDA 동아리의 우수성을 알렸다. 
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End popular-course Area -->

	<!-- Start upcoming-event Area -->
	<section class="upcoming-event-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-70 col-lg-8">
					<div class="title text-center">
						<h1 class="mb-10">동아리 행사</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-upcoming-event-carusel">
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/su.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>18th December, 2020</p>
							<a href="#"><h4>동아리 종강총회</h4></a>
							<p>
								2학기를 마무리하며 동아리원들끼리 친목을 다질 수 있는 종강총회<br><br>※코로나 19 상황에 따라 진행
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/ex.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>21th October, 2020</p>
							<a href="#"><h4>동아리 체육대회</h4></a>
							<p>
								화창한 가을날, 동아리원들끼리 협업하며 함께하는 체육대회<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/m.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>26th September, 2020</p>
							<a href="#"><h4>동아리 MT</h4></a>
							<p>
								선후배가 서로 어우러져 1박을 하며 게임도 하고 술도 마시며 즐거운 시간을 보낼 수 있는 동아리 MT<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/du.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>3rd September, 2020</p>
							<a href="#"><h4>동아리 개강총회</h4></a>
							<p>
								2학기를 시작하며 동아리원들끼리 친목을 다질 수 있는 개강총회<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/su.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>1st July, 2020</p>
							<a href="#"><h4>동아리 종강총회</h4></a>
							<p>
								1학기를 마무리하며 동아리원들끼리 친목을 다질 수 있는 종강총회<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/ex.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>22th April, 2020</p>
							<a href="#"><h4>동아리 체육대회</h4></a>
							<p>
								산뜻한 봄날, 동아리원들끼리 협업하며 함께하는 체육대회<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/m.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>11th April, 2020</p>
							<a href="#"><h4>동아리 MT</h4></a>
							<p>
								선후배가 서로 어우러져 1박을 하며 게임도 하고 술도 마시며 즐거운 시간을 보낼 수 있는 동아리 MT<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
					<div class="single-carusel row align-items-center">
						<div class="col-12 col-md-6 thumb">
							<img class="img-fluid" src="img/index/su.jpg" alt="">
						</div>
						<div class="detials col-12 col-md-6">
							<p>24th March, 2020</p>
							<a href="#"><h4>동아리 개강총회</h4></a>
							<p>
								1학기를 시작하며 동아리원들끼리 친목을 다질 수 있는 개강총회<br><br>※코로나 19로 취소
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End upcoming-event Area -->

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