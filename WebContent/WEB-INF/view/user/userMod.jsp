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
<%@include file="/include/header.jsp"%>
<!-- End Header -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>회원정보 수정</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>회원정보 수정</li>
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
                                        <h1 class="h4 text-gray-900 mb-4">회원정보 수정</h1>
                                    </div>
                                    <div class="mb-3 mb-sm-0" style="margin-top: 15%;">
                                        <!-- 이름변경 form -->

                                        <form action="/userModproc.do" method="POST" class="user">
                                            <input type="hidden" id="seq" name="userSeq" value="<%=userSeq%>">
                                            <div class="form-group">
                                                이름
                                            </div>
                                            <div class="form-group" style="display:flex;">
                                                <input type="text" class="form-control form-control-user" id="name" name="userName" value="<%=userName%>">
                                                <input type="submit"class="btn btn-primary btn-user btn-block col-lg-3"style="width: 25%;min-width: 92px;"value="이름변경" onclick="return NC();">
                                            </div>
                                            <!-- 이메일 변경 form -->
                                            <div class="form-group">
                                                이메일 주소
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" id="email1" name="userEmail" value="<%=userEmail%>" >
                                            </div>
                                            <div class="form-group">
                                                <input type="button" class="btn btn-primary btn-user btn-block" id="eCheck" value="이메일 중복확인">
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" class="btn btn-primary btn-user btn-block" id="eChange" value="이메일 변경">
                                            </div>
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="btn btn-primary btn-user btn-block" href="/findPw.do">비밀번호 변경</a>
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
<script type="text/javascript">
    $(function(){

        $("#eCheck").click(function(){
            var email=$("#email1").val();
            var eCheck=$("#eCheck").val();
            var re2 =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            console.log(email);
            if(email==""){
                alert("새로 사용하실 이메일을 입력해 주세요.");
                $("#email").focus();
            }else if(email=="<%=userEmail%>"){
                alert("회원님께서 이미 사용중인 이메일 입니다.");
                phone.focus();
                return false;
            }

            else{
                $.ajax({
                    url : "/eCheck.do",
                    type : 'POST',
                    data : {'email':email},
                    success : function(data){
                        console.log(data);
                        if(!re2.test(email)) {
                            alert("이메일 형식을 확인해주세요.");
                            $("#email").focus();
                            return false;
                        } else {
                            if(data == 0){
                                alert("사용 가능한 이메일 입니다.");
                                $("#ib").focus();
                                $('#showreq').attr('type','button')
                            }else{
                                alert("이미 사용중인 이메일 입니다.");
                                $("#email").focus();
                            }
                        }
                    },
                    error : function(error){
                        alert("error : " + error);
                    }
                });
            }});
    });


    function NC(){
        var name = document.getElementById("name");

        if(name.value==""){
            alert("새로 사용하실 이름을 입력해 주세요.")
            name.focus();
            return false;
        }
        else if(name.value=="<%=userName%>") {
            alert("회원님께서 이미 사용중인 이름입니다.");
            name.focus();
            return false;
        }
    }
</script>
<script type="text/javascript">
    $('#um').css({
        color: "#1ABC9C"
    });
    $('#navbardrop').css({
        color: "#1ABC9C"
    });
</script>

</html>
