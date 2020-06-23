<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="poly.dto.MovieDetailDTO" %>
<%
    List<MovieDetailDTO> sList = (List<MovieDetailDTO>)request.getAttribute("sList");
%>
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
                            <form action="/getSerchList.do" method="post">
                            <span class="inp_clar_box on">
                              <input type="text" name="keyword" id="serchtext" value="" class="inp_st inp_val" placeholder="검색어를 입력하세요.">
                              <button type="button" onclick="fnClearSch()" class="btn_inp_clear btn_x_sm"></button>
                            </span>
                            <button type="submit" class="btn_searchBig eve_real_search"></button>
                            </form>
                        </div>
                        <section id="services" class="services section-bg">
                            <% if (sList.size() == 0) {%>
                            <!-- 검색 결과가 없는경우 -->
                            <div class="no_search_data" id="schNoData">
                                <p class="ns_tit">검색결과가 없습니다.</p>
                                <ul class="li_bar">
                                    <li>단어의 철자가 정확한지 확인해 보세요.</li>
                                    <li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
                                    <li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
                                    <li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
                                </ul>
                            </div>
                            <% } else { %>
                            <div class="un_serch_block" id="movieList">
                                <p class="sm_title">영화(<%=sList.size()%>건)</p>
                                    <% for (int i = 0; i < sList.size(); i++) {%>
                                <div class="tbl_type" style="display: none">
                                    <div class="tbl_col">
                                        <div class="movie_info">
                                            <div class="ib_thumb" onclick="location.href='movieDetail.do?mid=<%=sList.get(i).getMid()%>'" style="cursor:pointer;"><img
                                                    src="<%=sList.get(i).getImage()%>">
                                            </div>
                                            <div class="ib_info">
                                                <p class="ib_tit"><a href="movieDetail.do?mid=<%=sList.get(i).getMid()%>"><span class="col_point"><%=sList.get(i).getTitle()%></span></a></p>
                                                <p class="ib_txt_info"> <span><%=sList.get(i).getMv_info()%></span></p>
                                                <p class="ib_txt">감독 : <a><%=sList.get(i).getDirector()%></a></p>
                                                <p class="ib_txt">출연 : <a><%=sList.get(i).getActor()%></a></p>
                                                <div class="btn_area"> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <% } %>
                                <div class="search_more" id="load"><a href="">+ 검색결과 더보기</a>
                                </div>
                            </div>
                            <% } %>
                        </section><!-- End Services Section -->
                    </div>
                </div>
            </div>
        </div>
    </section><!-- End Clients Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@include file="/include/footer.jsp"%>
<!-- End Footer -->

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
<script type="text/javascript">
    function fnClearSch(){
        $("#serchtext").val("");
    }

    $(function () {
        $(".tbl_type").slice(0, 5).show();
        if ($(".tbl_type:hidden").length == 0) {
            $('#load').attr('style', "display:none;");
        }
        $("#load").click(function (e) {
            e.preventDefault();
            $(".tbl_type:hidden").slice(0, 5).show();
            if ($(".tbl_type:hidden").length == 0) {
                $('#load').attr('style', "display:none;");
            }
        })
    })
</script>

</body>

</html>
