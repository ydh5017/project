<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="poly.dto.MyMovieDTO" %>
<%@page import="java.util.List" %>
<%
    List<MyMovieDTO> mList = (List<MyMovieDTO>)request.getAttribute("mList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>나의 영화</title>
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

    <section id="clients" class="blog">
    <div class="search_container_area">
        <div class="search_cont lay_inner">
            <section id="services" class="services section-bg">
            <div class="un_serch_block" id="movieList">
                <% if (mList.size() == 0) {%>
                <div class="head_top_title">
                    등록된 나의 영화가 없습니다.
                </div>
                <% } else { %>
                <% for (int i = 0; i < mList.size(); i++) {%>
                <div class="tbl_type" style="display: none">
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick="location.href='MYmovieDetail.do?mid=<%=mList.get(i).getMovie_id()%>'"
                                 style="cursor: pointer; position: relative; background: rgb(229, 229, 229);"><img
                                    src="<%=mList.get(i).getImage()%>" class="sch_noImg"></div>
                            <div class="ib_info">
                                <form action="/mymovieListDel.do" id="md<%=i%>">
                                <p class="ib_tit"><a href="MYmovieDetail.do?mid=<%=mList.get(i).getMovie_id()%>"><span class="col_point"><%=mList.get(i).getTitle()%></span></a>
                                    <a onclick="return mDel(<%=i%>)" style="float: right; display: inline-block; background: #1bbd36;
                                     color: #fff; padding: 7px 25px; transition: 0.3s;
                                      font-size: 14px; border-radius: 4px;">나의 영화 목록에서 삭제</a>
                                    <input type="hidden" name="mymovie_seq" value="<%=mList.get(i).getMymovie_seq()%>">
                                    <input type="hidden" name="mid" value="<%=mList.get(i).getMovie_id()%>">
                                </p>
                                </form>
                                <p class="ib_txt"><a><%=mList.get(i).getMv_info()%></a></p>
                                <p class="ib_txt">감독 : <a><%=mList.get(i).getDirector()%></a></p>
                                <p class="ib_txt">출연 : <a><%=mList.get(i).getActor().replace("& #40;","(").replace("& #41;",")")%></a></p>
                                <p class="ib_txt"><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <% i++; if (i < mList.size()) {%>
                    <div class="tbl_col">
                        <div class="movie_info">
                            <div class="ib_thumb" onclick="location.href='MYmovieDetail.do?mid=<%=mList.get(i).getMovie_id()%>'"
                                 style="cursor: pointer; position: relative; background: rgb(229, 229, 229);"><img
                                    src="<%=mList.get(i).getImage()%>" class="sch_noImg"></div>
                            <div class="ib_info">
                                <form action="/mymovieListDel.do" id="md<%=i%>">
                                    <p class="ib_tit"><a href="MYmovieDetail.do?mid=<%=mList.get(i).getMovie_id()%>"><span class="col_point"><%=mList.get(i).getTitle()%></span></a>
                                        <a onclick="return mDel(<%=i%>)" style="float: right; display: inline-block; background: #1bbd36;
                                     color: #fff; padding: 7px 25px; transition: 0.3s;
                                      font-size: 14px; border-radius: 4px;">나의 영화 목록에서 삭제</a>
                                        <input type="hidden" name="mymovie_seq" value="<%=mList.get(i).getMymovie_seq()%>">
                                        <input type="hidden" name="mid" value="<%=mList.get(i).getMovie_id()%>">
                                    </p>
                                </form>
                                <p class="ib_txt"><a><%=mList.get(i).getMv_info()%></a></p>
                                <p class="ib_txt">감독 : <a><%=mList.get(i).getDirector()%></a></p>
                                <p class="ib_txt">출연 : <a><%=mList.get(i).getActor().replace("& #40;","(").replace("& #41;",")")%></a></p>
                                <p class="ib_txt"><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <% } %>
            </div>
            <div class="btn_bottom_area mt60" id="btnListMore">
                <button type="button" id="load" class="btn_defaultB ">더보기</button>
            </div>
            <% } %>
    </section>
        </div>
    </div>
    </section>

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
    function mDel(i){
        var result;
        console.log(i);
        result = confirm("나의 영화 목록에서 삭제하시겠습니까?");
        console.log(result);
        if (result){
            $('#md'+i).submit();
        }else{
            alert("취소되었습니다.");
        }
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
