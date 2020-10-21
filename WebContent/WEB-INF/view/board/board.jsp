<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="poly.dto.PagingDTO" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List" %>
<%@page import="poly.dto.BoardDTO"%>
<%
    List<BoardDTO> bList=(List<BoardDTO>)request.getAttribute("bList");
    PagingDTO paging = (PagingDTO) request.getAttribute("paging");

    SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");

    Date time = new Date();

    String time1 = format1.format(time);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>평점/리뷰게시판</title>
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

    <link href="assets/css/board.css" rel="stylesheet">
    <link href="/summernote/summernote-bs4.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Company - v2.0.1
    * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<%@include file="/include/header.jsp" %>

<script src="/summernote/summernote-bs4.min.js"></script>
<script src="/summernote/summernote-bs4.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
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
    <div class="search_container_area">
        <div class="search_cont lay_inner">
            <div class="head_top_title">
                평점/리뷰 게시판
            </div>
            <div style="width: 100%; padding-top: 1%;margin-bottom: 5%;">
                <div class="listWrapper">
                    <%
                        //로그인 안한경우
                        if (userEmail==null) {%>
                    <div></div>
                    <% }
                    //로그인한경우
                    else {
                    %>
                    <div><button style="float:right; color:white; margin-bottom:1%; background-color:#1ABC9C" class="btn" onclick="location.href='boardAdd.do'">글쓰기</button></div>
                    <div></div>
                    <% }%>
                    <div class="listHead">
                        <div class="listNum">번호</div>
                        <div class="listTitle">영화</div>
                        <div class="listTitle">제목</div>
                        <div class="listWriter">작성자</div>
                        <div class="listWhen">작성일</div>
                        <div class="listReadCnt">조회수</div>
                    </div>
                    <%
                        for (int i = 0; i < bList.size(); i++) {
                            int number = paging.getListCnt() - i - ((paging.getPage() - 1) * 15);
                    %>
                    <div class="listTag" style="color:red;background-color: #f5c6cb;">
                        <div class="listTag">
                            <div class="listNum"><%=number%>
                            </div>
                            <div class="listTitle"><%=bList.get(i).getBoard_notice() %>
                            </div>
                            <div class="listTitle" onclick="location.href='boardDetail.do?no=<%=bList.get(i).getBoard_seq() %>&Pno=1'"><a href="#">
                                    <%=bList.get(i).getBoard_title().replace(">","&gt;").replace("<","&lt;").replace("'","&#39;").replace("script", "")  %>
                            </div>
                            <div class="listWriter"><%=bList.get(i).getReg_id() %>
                            </div>
                            <div class="listWhen"><%=bList.get(i).getReg_dt() %>
                            </div>
                            <div class="listReadCnt"><%=bList.get(i).getBoard_count() %>
                            </div>
                        </div>
                        <% } %>
                        <div class="listHead"></div>
                        <div id="pNumWraaper">
                            <% if (paging.isPrev() == true) { %>
                            <a class="pNumStart" href="/board.do?Pno=<%=paging.getStartPage()-10%>">이전</a>
                            <%} %>

                            <% for (int a = paging.getStartPage(); a <= paging.getEndPage(); a++) {
                                if (paging.getPage() == a) { %>
                            <div class='pNum' style="background-color:#1abc9c;color:white;"><%=a%>
                            </div>
                            <%} else {%>
                            <a class='pNum' href="/board.do?Pno=<%=a%>"><%=a%>
                            </a>
                            <%
                                    }
                                }
                            %>
                            <% if (paging.isNext() == true) { %>
                            <a class="pNumEnd" href="/board.do?Pno=<%=paging.getEndPage()+1%>">다음</a>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                $('#admin').css({
                    color: "#1ABC9C"
                });
            </script>
        </div>
    </div>


</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@include file="/include/footer.jsp" %>
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