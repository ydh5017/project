
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Portfolio - Company Bootstrap Template</title>
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
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>나의 영화</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>나의 영화</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <div class="search_container_area">
        <div class="search_cont lay_inner">
            <div class="un_serch_block" id="movieList">
                <div class="tbl_type">
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor: pointer; position: relative; background: rgb(229, 229, 229);"><img
                                    src="https://movie-simg.yes24.com/NYes24//new/ic_noimg_com.png"
                                    onerror="" alt="인비저블 라이프 A Vida Invisivel" class="sch_noImg"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077697">인비저블 라이프 A Vida Invi<span
                                        class="col_point">s</span>ivel</a></p>
                                <p class="ib_txt_info"> <span>2020.06.24 개봉</span> <span>140분</span> <span>청소년 관람불가</span>
                                    <span>드라마</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=45859">카림 아나우즈</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=45860">줄리아 스토클러</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=45861">캐롤 두아르테</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M96/M000077696_141931.jpg"
                                    onerror="" alt="딥워터 Breaking Surface"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077696">딥워터 Breaking <span
                                        class="col_point">S</span>urface</a></p>
                                <p class="ib_txt_info"> <span>81분</span> <span>12세이상관람가</span> <span>액션,드라마,스릴러</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=45858">요아힘 헤덴</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=36517">모아 감멜</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=34466">매들린 마틴</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tbl_type">
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M92/M000077692_143145.jpg"
                                    onerror="" alt="트라우마 Back Roads"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077692">트라우마 Back Road<span
                                        class="col_point">s</span></a></p>
                                <p class="ib_txt_info"> <span>2020.06.04 개봉</span> <span>100분</span> <span>청소년 관람불가</span>
                                    <span>드라마</span> <span>미국</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=26267">알렉스 페티퍼</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=26267">알렉스 페티퍼</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=2676">제니퍼 모리슨</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=27484">니콜라 펠츠</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M91/M000077691_141645.jpg"
                                    onerror=""
                                    alt="1945: 포인트 오브 노 리턴 The Eastern Front: Point of No Return"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077691">1945: 포인트 오브 노 리턴 The Ea<span
                                        class="col_point">s</span>tern Front: Point of No Return</a></p>
                                <p class="ib_txt_info"> <span>85분</span> <span>미정</span> <span>전쟁</span> <span>영국</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=45854">릭 로버츠</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=45855">조쉬 하퍼</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=45856">닐 워드</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=45857">로라 진 마쉬</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tbl_type">
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M77/M00007767750_155655.jpg"
                                    onerror="" alt="엔딩스 비기닝스 ENDINGS, BEGINNINGS"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077677">엔딩스 비기닝스 ENDING<span
                                        class="col_point">S</span>, BEGINNING<span class="col_point">S</span></a></p>
                                <p class="ib_txt_info"> <span>미정</span> <span>드라마</span> <span>미국, 한국</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=25839">드레이크 도리머스</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=29827">쉐일린 우들리</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=33654">제이미 도넌</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=5781">세바스찬 스탠</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M63/M000077663_092116.jpg"
                                    onerror=""
                                    alt="너는 달밤에 빛나고 君は月夜に光り輝く, You Shine in the Moonlit Night"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077663">너는 달밤에 빛나고 君は月夜に光り輝く, You <span
                                        class="col_point">S</span>hine in the Moonlit Night</a></p>
                                <p class="ib_txt_info"> <span>101분</span> <span>12세이상관람가</span> <span>멜로,로맨스</span> <span>일본</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=39272">츠키카와 쇼</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=41111">키타무라 타쿠미</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=41354">나가노 메이</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=45158">오이카와 미츠히로</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=5613">하세가와 쿄코</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=45849">카이 쇼우마</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=44295">마츠모토 호노카</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tbl_type">
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M59/M000077659_165056.jpg"
                                    onerror=""
                                    alt="트윈 머더스: 살인 코드 El silencio de la ciudad blanca, Twin Murders: The silence of the White City"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077659">트윈 머더스: 살인 코드 El <span
                                        class="col_point">s</span>ilencio de la ciudad blanca, Twin Murder<span class="col_point">s</span>:
                                    The <span class="col_point">s</span>ilence of the White City</a></p>
                                <p class="ib_txt_info"> <span>2020.05.28 개봉</span> <span>109분</span> <span>15세이상관람가</span>
                                    <span>미스터리,범죄,스릴러</span> <span>스페인</span> </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=34780">다니엘 칼파소로</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=45848">하비에르 레이</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=5479">벨렌 루에다</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=33945">오라 가리도</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick=";"
                                 style="cursor:pointer;"><img
                                    src="https://movie-simg.yes24.com/NYes24//MOVIE//M76/M37/M00007763750_161731.jpg"
                                    onerror="" alt="보이헌트 Where the Boys Are"></div>
                            <div class="ib_info">
                                <p class="ib_tit"><a href="/MovieInfo/Index?mId=M000077637">보이헌트 Where the Boy<span
                                        class="col_point">s</span> Are</a></p>
                                <p class="ib_txt_info"> <span>99분</span> <span>전체관람가</span> <span>코미디,드라마,멜로,로맨스</span> <span>미국</span>
                                </p>
                                <p class="ib_txt">감독 : <a href="/MovieInfo/DetailStepInfo?perId=45845">헨리 레빈</a></p>
                                <p class="ib_txt">배우 : <a href="/MovieInfo/DetailStepInfo?perId=9638">돌로레스 하트</a>, <a
                                        href="/MovieInfo/DetailStepInfo?perId=3724">조지 해밀턴</a></p>
                                <div class="btn_area"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn_bottom_area mt60" id="btnListMore">
                <button type="button" onclick="fnLIstMore();" class="btn_defaultB ">더보기</button>
            </div>
        </div>
    </div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
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
