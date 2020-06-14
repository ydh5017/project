<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

    <script type="text/javascript">
        function pwCheck(){
            var pw = $("#pw").val();
            var pwc = $("#pwc").val();
            console.log(pw);
            console.log(pwc);
            var contents = ""
            if(pw == pwc) {
                contents += "<div class='alert alert-success'>일치합니다.</div>";
                $('#showPwCheck').html(contents);
            } else {
                contents += "<div class='alert alert-danger'>일치하지 않습니다.</div>";
                $('#showPwCheck').html(contents);
            }
        }
    </script>
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
                <h2>비밀번호 찾기</h2>
                <ol>
                    <li><a href="/index.do">Home</a></li>
                    <li>비밀번호 찾기</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <section id="clients" class="blog">
        <div class="col-lg-12">
            <div class="container">

                <div class="card o-hidden border-0 shadow-lg my-5"style="width: 60%; margin: 0 auto;min-width: 320px;max-width: 500px;">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 변경</h1>
                                    </div>
                                    <form id="findPw" action="/findP.do" method="POST">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="email" name="userEmail" placeholder="이메일 주소">
                                        </div>
                                        <div class="form-group">
                                            <input type="button" class='btn btn-primary btn-user btn-block' id="eCheck" value="이메일 주소 확인">
                                            <input type="hidden" id="conf1" value="0">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" class="form-control form-control-user" id="pw" name="userPassword" placeholder="비밀번호">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" class="form-control form-control-user" id="pwc" placeholder="비밀번호 확인" onkeyup="pwCheck()">
                                        </div>
                                        <div id="showPwCheck" style="text-align: center;"></div>
                                        <input type="hidden" id="pc" value="비밀번호 변경하기" class="btn btn-primary btn-user btn-block">
                                    </form>
                                    <hr>
                                    <%if(userEmail==null){ %>
                                    <div class="text-center">
                                        <a class="small" href="/findEmail.do">아이디 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/userReg.do">회원가입 하기</a>
                                    </div>
                                    <%} else{%>
                                    <div class="text-center">
                                        <a class="small" href="/userMod.do">회원정보 수정 페이지 가기</a>
                                    </div>
                                    <%} %>
                                    <div class="text-center">
                                        <a class="small" href="/index.do">메인화면으로 가기</a>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


</body>

<script type="text/javascript">
    var eCheck=0;
    $(function(){

        $("#eCheck").click(function(){
            var email=$("#email").val();
            var eCheck=$("#eCheck").val();
            var re =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            console.log(email);
            if(email==""){
                alert("이메일을 입력해 주세요.");
                $("#email").focus();
            }else{
                $.ajax({
                    url : "/eCheck.do",
                    type : 'POST',
                    data : {'email':email},
                    success : function(data){
                        console.log(data);
                        if(!re.test(email)) {
                            alert("이메일 형식을 확인해주세요.");
                            $("#email").focus();
                            return false;
                        } else {
                            if(data == 0){
                                alert("입력하신 정보의 회원이 없습니다.");
                                $('#conf1').val("0");
                                $("#email").focus();
                            }else{
                                alert("이메일 주소가 확인되었습니다.");
                                $('#conf1').val("1");
                                $('#pw').attr('type','password')
                                $('#pwc').attr('type','password')
                                $('#pc').attr('type','submit')
                                pCheck=1;
                            }
                        }
                    },
                    error : function(error){
                        alert("error : " + error);
                    }
                });
            }});
    });


    $(function(){
        $("#pc").click(function(){

            var  pw = document.getElementById("pw");
            var  pwc = document.getElementById("pwc");


            if(pw.value==""){
                alert("비밀번호를 입력해 주세요.")
                pw.focus();
                return false;
            }
            if(pwc.value==""){
                alert("비밀번호 확인을 입력해 주세요.")
                pwc.focus();
                return false;
            }
            if(pwc.value!=pw.value){
                alert("비밀번호와 똑같이 입력해 주세요.")
                pwc.focus();
                return false;
            }
        })
    })

</script>
</html>