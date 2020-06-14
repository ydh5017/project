
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Services - Company Bootstrap Template</title>
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

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="Breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>영화 검색</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>영화 검색</li>
                </ol>
            </div>

        </div>
    </section><!-- End seach -->

    <section id="clients" class="blog">
        <div class="col-lg-12">

            <div class="sidebar" data-aos="fade-left">
                <!-- 영화 목록 -->
                <div class="search_container_area">
                    <div class="search_cont lay_inner">
                        <div class="head_top_title">
                            검색
                        </div>
                        <div class="ms_search_box ms_btm_area">
                <span class="inp_clar_box on">
                  <input type="text" id="txtSchVal" value="" class="inp_st inp_val" placeholder="검색어를 입력하세요.">
                  <button type="button" onclick="fnClearSch()" class="btn_inp_clear btn_x_sm"></button>
                </span>
                            <button type="button" onclick="fnSearch();" class="btn_searchBig eve_real_search"></button>
                        </div>
                        <section id="services" class="services section-bg">
                            <div class="un_serch_block" id="movieList">
                                <p class="sm_title">영화(1건)</p>
                                <div class="tbl_type">
                                    <div class="tbl_col">
                                        <div class="movie_info">
                                            <div class="ib_thumb" onclick="" style="cursor:pointer;"><img
                                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M13/M000077613_173943.jpg" onerror=""
                                                    alt="블러드샷 Bloodshot"></div>
                                            <div class="ib_info">
                                                <p class="ib_tit"><a href="#"><span class="col_point">블러드샷</span>
                                                    Bloodshot</a></p>
                                                <p class="ib_txt_info"> <span>2020.05.21 개봉</span> <span>109분</span> <span>15세이상관람가</span>
                                                    <span>액션,드라마,판타지,SF</span> <span>미국</span> </p>
                                                <p class="ib_txt">감독 : <a href="#">데이브 윌슨</a></p>
                                                <p class="ib_txt">배우 : <a href="#">빈 디젤</a>, <a href="#">에이자 곤살레스</a>, <a href="#">샘 휴건</a>,
                                                    <a href="#">가이 피어스</a></p>
                                                <div class="btn_area"> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="search_more"><a href="javascript:;" onclick="">+ 검색결과 더보기</a>
                                </div>
                            </div>
                        </section><!-- End Services Section -->
                    </div>
                </div>

                <!-- 검색 결과가 없는경우 -->
                <div class="no_search_data" id="schNoData" style="display: none;">
                    <p class="ns_tit">검색결과가 없습니다.</p>
                    <ul class="li_bar">
                        <li>단어의 철자가 정확한지 확인해 보세요.</li>
                        <li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
                        <li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
                        <li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
                    </ul>
                </div>
            </div>
        </div>
    </section><!-- End Clients Section -->

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



<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>
