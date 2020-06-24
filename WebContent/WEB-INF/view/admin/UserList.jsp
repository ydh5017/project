<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="poly.dto.PagingDTO" %>
<%@page import="java.util.List" %>
<%@page import="poly.dto.UserDTO" %>
<%
    List<UserDTO> uList = (List<UserDTO>) request.getAttribute("uList");
    PagingDTO paging = (PagingDTO) request.getAttribute("paging");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>회원관리</title>
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
<!-- End Header -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>회원관리</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>회원관리</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->
    <div class="search_container_area">
        <div class="search_cont lay_inner">
            <div class="head_top_title">
                회원관리
            </div>
            <div style="width: 100%; padding-top: 1%;margin-bottom: 5%;">
                <div class="listWrapper">
                    <div></div>
                    <div class="listHead">
                        <div class="listReadCnt">이름</div>
                        <div class="listemail">이메일 주소</div>
                        <div class="listWhen">가입일</div>
                        <div class="listWhen">정보 수정일</div>
                        <div class="listReadCnt">상태</div>
                        <div class="listReadCnt">관리</div>
                    </div>
                    <%
                        for (int i = 0; i < uList.size(); i++) {
                            int number = paging.getListCnt() - i - ((paging.getPage() - 1) * 15);
                    %>
                    <%if (uList.get(i).getUserAss().equals("2")) {%>
                    <div class="listTag" style="color:red;background-color: #f5c6cb;"><%} else { %>
                        <div class="listTag"><%} %>
                            <div class="listReadCnt"><%=uList.get(i).getUserName() %>
                            </div>
                            <div class="listemail"><%=uList.get(i).getUserEmail() %>
                            </div>
                            <div class="listWhen"><%=uList.get(i).getUserReg_dt() %>
                            </div>
                            <div class="listWhen"><%if (uList.get(i).getUserChg_dt() == null) {%>
                                -<%} else {%><%=uList.get(i).getUserChg_dt() %><%} %></div>
                            <div class="listReadCnt"><%if (uList.get(i).getUserAss().equals("1")) {%>
                                관리자<%} else if (uList.get(i).getUserAss().equals("0")) {%>사용자<%} else { %>정지<%} %></div>
                            <div class="listReadCnt">
                                <form id="admin<%=number %>" action="/AdminMod.do" method="POST" class="user">
                                    <input type="hidden" name="userEmail" value="<%=uList.get(i).getUserEmail()%>">
                                    <input type="hidden" id="Aass<%=number%>" name="userAss"
                                           value="<%=uList.get(i).getUserAss()%>">
                                    <input type="hidden" id="Aname<%=number%>" name="userName"
                                           value="<%=uList.get(i).getUserName()%>">
                                    <input type="hidden" name="Pno" value="<%=paging.getPage()%>">

                                    <select name="job" onchange="return Admin(<%=number%>);" id="Ajob<%=number%>"
                                            style="min-width:80px;width:15%;border: none;<%if(uList.get(i).getUserAss().equals("2")){%>background-color: #f5c6cb;color: red;<%}%>">
                                        <option value="0" selected disabled>선택</option>
                                        <%if (uList.get(i).getUserAss().equals("1")) { %>
                                        <option value="1">사용자</option>
                                        <%} else if (uList.get(i).getUserAss().equals("0")) { %>
                                        <option value="2">관리자</option>
                                        <%} %>
                                        <%if (uList.get(i).getUserAss().equals("2")) { %>
                                        <option value="3">활성화</option>
                                        <%} else {%>
                                        <option value="4">비활성화</option>
                                        <%} %>
                                        <option value="5">삭제</option>
                                    </select>
                                </form>
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

                $(document).ready(function () {
                    if (userAss != 0)
                    {
                        alert("관리자만 이용할 수 있슴니다.");
                        location.href = "/index.do";
                    }
                });

                function Admin(number) {
                    var job = $('#Ajob' + number).val();
                    var name = $('#Aname' + number).val();
                    var result;

                    if (job == "1") {
                        result = confirm(name + "님의 관리자 권한을 삭제하시겠습니까?");
                    } else if (job == "2") {
                        result = confirm(name + "님에게 관리자 권한을 추가하시겠습니까?");
                    } else if (job == "3") {
                        result = confirm(name + "님의 정지를 해제하시겠습니까?");
                    } else if (job == "4") {
                        result = confirm(name + "님을 정지 상태로 만드시겠습니까?");
                    } else {
                        result = confirm(name + "님의 계정을 삭제하시겠습니까?");
                    }
                    console.table(result)
                    if (result) {
                        $('#admin' + number).submit();
                    } else {
                        alert("취소되었습니다.");
                        $('#Ajob' + number).val('0');
                    }
                };
            </script>
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