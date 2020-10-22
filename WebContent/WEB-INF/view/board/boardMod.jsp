<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="poly.dto.MovieDTO" %>
<%
    String Seq=(String)request.getAttribute("board_seq");
    List<MovieDTO> rList=(List<MovieDTO>)request.getAttribute("rList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>게시글 수정</title>
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
    <link href="/css/board.css" rel="stylesheet">
    <link rel="stylesheet" href="/summernote/summernote-lite.css">

    <style>
        .starR1 {
            background:
                    url('http://miuu227.godohosting.com/images/icon/ico_review.png')
                    no-repeat -52px 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR2 {
            background:
                    url('http://miuu227.godohosting.com/images/icon/ico_review.png')
                    no-repeat right 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR1.on {
            background-position: 0 0;
        }

        .starR2.on {
            background-position: -15px 0;
        }
    </style>

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
                <h2>평점/리뷰게시판</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>평점/리뷰게시판</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <section id="clients" class="blog">
        <div class="search_container_area">
            <div class="search_cont lay_inner">
                <section id="services" class="services section-bg">
                    <div style="width: 100%; padding-top: 1%; text-align:center; margin:0 auto">
                        <form onsubmit="return buhs();" action="/boardModproc.do" method="POST">
                            <input type="hidden" name="board_seq" value="<%=Seq%>">
                            <div class="form-group">
                                <input type="text" class="form-control" style="width: 75%;margin:0 auto;max-width: 1000px;" placeholder="제목을 입력해주세요.(최대 50자)" id="title" name="board_title">
                            </div>
                            <div class="form-group">
                                <select class="custom-select col-lg-3"style="width: 75%;max-width: 1000px;"id="notice"name="board_notice">
                                    <option selected disabled>영화 선택</option>
                                    <%
                                        for (int i = 0; i < rList.size(); i++) {
                                    %>
                                    <option value="<%=rList.get(i).getTitle()%>"><%=rList.get(i).getTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="ag_cont_box">
                                    <div class="ag_top">
                                        <span class="agt_tit">나의 평점</span>
                                        <div class="star_area big eve_star_parent" id="myGradeA">
                                            <div class="starRev">
                                                <span class="starR1" id="s05">별1_왼쪽</span>
                                                <span class="starR2" id="s10">별1_오른쪽</span>
                                                <span class="starR1" id="s15">별2_왼쪽</span>
                                                <span class="starR2" id="s20">별2_오른쪽</span>
                                                <span class="starR1" id="s25">별3_왼쪽</span>
                                                <span class="starR2" id="s30">별3_오른쪽</span>
                                                <span class="starR1" id="s35">별4_왼쪽</span>
                                                <span class="starR2" id="s40">별4_오른쪽</span>
                                                <span class="starR1" id="s45">별5_왼쪽</span>
                                                <span class="starR2" id="s50">별5_오른쪽</span>
                                                <input type="text" class="star_num" id="SP" value="0" readonly style="border: none" onfocus='this.blur();'>
                                                <input type="hidden" id="point" name="point" value="0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin:0 auto;text-align:justify;width: 75%;max-width: 1000px;">
                                <textarea id="summernote" name="board_content"></textarea>
                            </div>
                            <div>
                                <button type="button" class="btn" style="background-color:rgba(235,70,70,0.7); color:white; margin-top: 2%;margin-right:2%;margin-bottom:2%;" onclick="history.back()">뒤로가기</button>
                                <input type="submit" class="btn" style="background-color:rgb(129, 114, 242);margin-top:2%;margin-left:2%;margin-bottom:2%;; color:white;" value="작성하기">
                            </div>
                        </form>
                    </div>
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

<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script type="text/javascript">
    document.querySelector('#summernote').value ='';
    $(document).ready(function() {
        $('#summernote').summernote({
            height:500,
            lang: 'ko-KR',
            fontNames : [ '맑은고딕' , 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
            fontNamesIgnoreCheck : ['맑은고딕' ],
            placeholder: '내용을 입력해주세요.(최대2000자)',
        });
    });
</script>

<script type="text/javascript">
    function buhs(){
        var title = document.getElementById("title");
        var notice = document.getElementById("notice");
        var content = document.getElementById("summernote");
        var point=$('#point').val();

        if(title.value==""){
            alert("제목을 입력해 주세요.");
            title.focus();
            return false;
        }else if(notice.value=="영화 선택"){
            alert("영화를 선택해 주세요.");
            notice.focus();
            return false;
        }else if (point == "0"){
            alert("평점을 정해 주세요.");
            return false;
        }else if(content.value==""){
            alert("내용을 입력해 주세요.");
            $('#summernote').summernote('focus');
            return false;
        }
    }
</script>

<script>
    $('.starRev span').click(function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });
    $('#s05').click(function() {
        $('#SP').attr('value', '1');
        $('#point').attr('value', '1');
    });
    $('#s10').click(function() {
        $('#SP').attr('value', '2');
        $('#point').attr('value', '2');
    });
    $('#s15').click(function() {
        $('#SP').attr('value', '3');
        $('#point').attr('value', '3');
    });
    $('#s20').click(function() {
        $('#SP').attr('value', '4');
        $('#point').attr('value', '4');
    });
    $('#s25').click(function() {
        $('#SP').attr('value', '5');
        $('#point').attr('value', '5');
    });
    $('#s30').click(function() {
        $('#SP').attr('value', '6');
        $('#point').attr('value', '6');
    });
    $('#s35').click(function() {
        $('#SP').attr('value', '7');
        $('#point').attr('value', '7');
    });
    $('#s40').click(function() {
        $('#SP').attr('value', '8');
        $('#point').attr('value', '8');
    });
    $('#s45').click(function() {
        $('#SP').attr('value', '9');
        $('#point').attr('value', '9');
    });
    $('#s50').click(function() {
        $('#SP').attr('value', '10');
        $('#point').attr('value', '10');
    });
</script>

</body>

</html>

