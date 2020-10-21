<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String userAss=(String)session.getAttribute("SS_userAss");
    if(userAss==null)
        userAss="3";
    String userEmail=(String)session.getAttribute("SS_userEmail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pricing - Company Bootstrap Template</title>
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
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

        <h1 class="logo mr-auto"><a href="/index.do"><span>Movie</span>Moa</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav class="nav-menu d-none d-lg-block">
            <ul>
                <li class="active"><a href="/index.do">Home</a></li>
                <li><a href="/serch.do">영화 검색</a></li>
                <% if (userEmail != null) { %>
                <li><a href="/mymovie.do">나의 영화</a></li>
                <li><a href="/userDetail.do">마이페이지</a></li>
                <% } %>
                <% if (userAss.equals("1")) {%>
                <li><a href="/UserList.do?Pno=1">회원관리</a></li>
                <% } %>
                <li><a href="/board.do?Pno=1">평점/리뷰게시판</a></li>

            </ul>
        </nav><!-- .nav-menu -->

        <div class="header-social-links">
            <% if (userEmail == null) { %>
            <a href="/login.do" class="twitter"><i class="icofont-user"></i> 로그인</a>
            <% } else { %>
            <a href="/logout.do" class="twitter"><i class="icofont-user"></i> 로그아웃</a>
            <% } %>
        </div>

    </div>
</header><!-- End Header -->



</body>


</html>