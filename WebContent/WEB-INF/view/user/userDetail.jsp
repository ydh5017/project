<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String userSeq=(String)session.getAttribute("SS_userSeq");
    String userName=(String)session.getAttribute("SS_userName");
    String userReg_dt=(String)session.getAttribute("SS_userReg_dt");
    String userChg_dt=(String)session.getAttribute("SS_userChg_dt");
    String userChg_id=(String)session.getAttribute("SS_userChg_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>회원정보</title>
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
                <h2>회원정보</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>회원정보</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <section id="clients" class="blog">
        <div class="col-lg-12">
            <div class="container"style="margin-top:7rem;">

                <div class="card o-hidden border-0 shadow-lg my-5"style="width: 60%; margin: 0 auto;min-width: 320px;max-width: 500px;">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">회원정보 상세</h1>
                                    </div>

                                    <div class="mb-3 mb-sm-0" style="margin-top: 15%;">
                                        <div class="form-group">
                                            회원 번호
                                        </div>

                                        <input type="text" class="form-control form-control-user" id="" name="userSeq" placeholder="<%=userSeq %>" readonly>
                                        <div class="form-group">
                                            이름
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="name" name="userName" placeholder="<%=userName%>" readonly>
                                        </div>
                                        <div class="form-group">
                                            이메일 주소
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="email1" name="userEmail" placeholder="<%=userEmail%>" readonly>
                                        </div>
                                        <div class="form-group">
                                            회원 가입일
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="ur" name="userRegdate" placeholder="<%=userReg_dt %>" readonly>
                                        </div>
                                        <div class="form-group">
                                            최근 회원 정보 수정일
                                        </div>
                                        <div class="form-group">
                                            <%if(userChg_dt==null){ %>
                                            <input type="text" class="form-control form-control-user" id="nud" name="userUpdate" placeholder="아직 회원정보를 한번도 수정하지 않았습니다." readonly>
                                            <%}else{ %>
                                            <input type="text" class="form-control form-control-user" id="ud" name="userUpdate" placeholder="<%=userChg_dt %>" readonly>
                                            <%} %>
                                        </div>
                                        <div class="form-group">
                                            최근 정보를 수정한 회원의 번호
                                        </div>
                                        <%if(userChg_id==null){ %>
                                        <input type="text" class="form-control form-control-user" id="nun" name="userUpnum" placeholder="아직 회원정보를 한번도 수정하지 않았습니다." readonly>
                                        <%}else{ %>
                                        <input type="text" class="form-control form-control-user" id="un" name="userUpnum" placeholder="<%=userChg_id %>" readonly>
                                        <%} %>
                                        <div class="text-center">
                                            <a class="small" href="/userMod.do">회원정보 수정하기</a>
                                        </div>
                                        <div class="form-group">
                                        <div class="text-center">
                                            <a class="small" href="/userDelete.do">회원탈퇴</a>
                                        </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


</body>


</html>