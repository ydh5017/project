<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String user_mail=(String)session.getAttribute("SS_userEmail");

    SimpleDateFormat format1 = new SimpleDateFormat ( "MMddss");

    Date time = new Date();

    String time1 = format1.format(time);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>실시간채팅</title>
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

    <style>
        #messageWindow {
            width: 800px;
            min-width: 800px;
            height: 500px;
            min-height: 500px;
            border: 1px solid black;
            display: block;
            overflow-y:scroll;
            scroll-behavior:smooth;
            margin: auto;
        }
        #inputMessage {
            width: 700px;
            height: 30px;
        }
        #msg_process {
            width: 90px;
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
<%@include file="/include/header.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.1/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<!-- End Header -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>실시간채팅</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>실시간채팅</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->
    <div class="search_container_area">
        <div class="search_cont lay_inner">
            <div class="head_top_title">
                실시간채팅
            </div>
            <div style="width: 100%; padding-top: 1%;margin-bottom: 5%;">
                <div>
                   <div id="messageWindow"></div>
                </div>
                <div style="width: 100%; padding-top: 1%;margin-bottom: 5%; text-align: center">
                    <input type="text" id="inputMessage">
                    <input class="btn btn-primary" id="msg_process" type="submit" onclick="logincheck()" value="전송">
                </div>
            </div>


        </div>
    </div>
    <script>
        var chat = io('http://localhost:3000/');
        console.log(chat);
        let user_mail = "<%=user_mail%>";
        var time = "<%=time1%>";

        //msg에서 키를 누를떄
        $("#inputMessage").keydown(function(key) {
            //해당하는 키가 엔터키(13) 일떄
            if (key.keyCode == 13) {
                //msg_process를 클릭해준다.
                msg_process.click();
            }
        });
            function send() {

                chat.emit("login", {
                    userid: user_mail
                });
                chat.emit("chat",{
                    msg: $('#inputMessage').val()
                });
            }

        function logincheck(){

            if (user_mail == "null"){
                user_mail = "익명" + time;

                send();
                $('#inputMessage').val('');

            }else{
                send();
                $('#inputMessage').val('');
            }
        }

        chat.on("s2c chat", function(data){
            var time = new Date();
            var timeStr = time.toLocaleTimeString();
            var user_id = data.from.userid;

            if (user_id == user_mail){
                document.getElementById('messageWindow').innerHTML = "<div style='text-align: end'>"+"[ "+timeStr+ " ] " + data.from.userid + " 님이 보낸 채팅 : " + data.msg + "</div>" + "<br/>" + document.getElementById('messageWindow').innerHTML;
            }else{
                document.getElementById('messageWindow').innerHTML = "<div style='text-align: start'>"+"[ "+timeStr+ " ] " + data.from.userid + " 님이 보낸 채팅 : " + data.msg + "</div>" + "<br/>" + document.getElementById('messageWindow').innerHTML;
            }
        })
    </script>

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