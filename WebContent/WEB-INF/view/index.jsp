<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.MovieDTO"%>
<%
	List<MovieDTO> rList = (List<MovieDTO>)request.getAttribute("rList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>Company Bootstrap Template - Index</title>
	<meta content="" name="descriptison">
	<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="assets/img/favicon.png" rel="icon">
	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

	<!-- Google Fonts -->
	<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
			rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
	<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="assets/vendor/aos/aos.css" rel="stylesheet">
	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="assets/css/style.css" rel="stylesheet">

	<!-- =======================================================
    * Template Name: Company - v2.0.1
    * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<%@include file="/include/header.jsp"%>
<!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero">
	<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

		<div class="carousel-inner" role="listbox">

			<!-- Slide 1 -->
			<div class="carousel-item active" style="background-image: url(/assets/img/slide/slide-1.jpg);">
				<div class="carousel-container">
					<% for (int i = 0; i < 5; i++) {%>
					<div class="movie_info_card" onclick="location.href='movieDetail.do?mid=<%=rList.get(i).getMid()%>'">
						<div class="img_thumb">
							<img src="<%=rList.get(i).getImage() %>">
							<span class="rank_num"><%=rList.get(i).getRank() %></span>
							<div class="over_dmm">
							</div>
						</div>
						<div class="mv_info">
							<p class="mv_tit">
								<%=rList.get(i).getTitle() %>
							</p>
							<p class="mv_txt">
								<span>예매율 : <%=rList.get(i).getTicket() %> </span>
							</p>
						</div>
					</div>
					<% } %>
				</div>
			</div>

			<!-- Slide 2 -->
			<div class="carousel-item" style="background-image: url(/assets/img/slide/slide-2.jpg);">
				<div class="carousel-container">
					<% for (int i = 5; i < 10; i++) {%>
					<div class="movie_info_card" onclick="location.href='movieDetail.do?mid=<%=rList.get(i).getMid()%>'">
						<div class="img_thumb">
							<img src="<%=rList.get(i).getImage() %>">
							<span class="rank_num"><%=rList.get(i).getRank() %></span>
							<div class="over_dmm">
							</div>
						</div>
						<div class="mv_info">
							<p class="mv_tit">
								<%=rList.get(i).getTitle() %>
							</p>
							<p class="mv_txt">
								<span>예매율 : <%=rList.get(i).getTicket() %> </span>
							</p>
						</div>
					</div>
					<% } %>
				</div>
			</div>

			<!-- Slide 3 -->
			<div class="carousel-item" style="background-image: url(/assets/img/slide/slide-3.jpg);">
				<div class="carousel-container">
					<% for (int i = 10; i < 15; i++) {%>
					<div class="movie_info_card" onclick="location.href='movieDetail.do?mid=<%=rList.get(i).getMid()%>'">
						<div class="img_thumb">
							<img src="<%=rList.get(i).getImage() %>">
							<span class="rank_num"><%=rList.get(i).getRank() %></span>
							<div class="over_dmm">
							</div>
						</div>
						<div class="mv_info">
							<p class="mv_tit">
								<%=rList.get(i).getTitle() %>
							</p>
							<p class="mv_txt">
								<span>예매율 : <%=rList.get(i).getTicket() %> </span>
							</p>
						</div>
					</div>
					<% } %>
				</div>
			</div>

		</div>

		<a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>

		<a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
			<span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>

		<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

	</div>
</section><!-- End Hero -->

<main id="main">

	<div class="content">
		<!-- 영화 -->
		<div class="movie_area">
			<div class="movie_cont lay_inner">
				<div class="head_top_title">
					예매순위
				</div>
				<div class="movie_rank_cont" id="movieRank">
					<% for (int i = 0; i < rList.size(); i++) { %>
					<div class="movie_info_card" onclick="location.href='movieDetail.do?mid=<%=rList.get(i).getMid()%>'">
						<div class="img_thumb">
							<img src="<%=rList.get(i).getImage() %>">
							<span class="rank_num"><%=rList.get(i).getRank() %></span>
							<div class="over_dmm">
							</div>
						</div>
						<div class="mv_info">
							<p class="mv_tit">
								<%=rList.get(i).getTitle() %>
							</p>
							<p class="mv_txt">
								<span>예매율 : <%=rList.get(i).getTicket() %> </span>
							</p>
						</div>
					</div>
					<% } %>
				</div>
				<div class="btn_bottom_area" id="dvTicketMore">
					<button type="button" class="btn_defaultB" onclick="javascript:fnTicketRankMore();">더보기</button>
				</div>
			</div>
		</div>
		<!-- //영화 영역 -->
	</div>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">

	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6 footer-contact">
					<h3>Company</h3>
					<p>
						A108 Adam Street <br>
						New York, NY 535022<br>
						United States <br><br>
						<strong>Phone:</strong> +1 5589 55488 55<br>
						<strong>Email:</strong> info@example.com<br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container d-md-flex py-4">

		<div class="mr-md-auto text-center text-md-left">
			<div class="copyright">
				&copy; Copyright <strong><span>Company</span></strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/company-free-html-bootstrap-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
		<div class="social-links text-center text-md-right pt-3 pt-md-0">
			<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
			<a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
			<a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
			<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
			<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
		</div>
	</div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/venobox/venobox.min.js"></script>
<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>

<script type="text/javascript">
	function fnTicketRankMore() {
		_pageNo += 1;
		_pageSize = 12;
		fnTicketList(_pageNo, _pageSize);
	}
</script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>