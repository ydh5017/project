<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page import="poly.dto.Board_ReviewDTO" %>
<%
    List<BoardDTO> bList=(List<BoardDTO>)request.getAttribute("bList");
    List<Board_ReviewDTO> rList = (List<Board_ReviewDTO>)request.getAttribute("rList");

    String title=(String)request.getAttribute("board_title");
    String content=(String)request.getAttribute("board_content");
    String writer=(String)request.getAttribute("reg_id");
    String count=(String)request.getAttribute("board_count");
    String date=(String)request.getAttribute("reg_dt");
    String Seq=(String)request.getAttribute("board_seq");
    String update=(String)request.getAttribute("chg_dt");
    String point=(String)request.getAttribute("point");

    String user_seq = (String)session.getAttribute("SS_userSeq");
    if (user_seq == null) {
        user_seq = "0";
    }
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
                        <div class="nanum"style="margin:0 auto;width:70%;padding-top:5%;margin-bottom:10%;">
                            <div class="boardTitle nanum"><%=title.replace(">","&gt;").replace("<","&lt;").replace("'","&#39;").replace("script", "")  %></div>
                            <hr>
                            <div>
                                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">작성자 : </a><%=writer %></div>
                                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;">작성일 : </a><%=date %></div>
                            </div>
                            <%if(update!=null){ %>
                            <div style="width:97%;display:inline-block;text-align:right;margin-top:2%;"><a style="color:gray;">최근 수정일 : </a><%=update %></div>
                            <%} %>
                            <div>
                                <div style="width:48%;display:inline-block;text-align:left;">
                                    <% String POINT = point; float point2 = Float.parseFloat(POINT); %>
                                    <div class="star_area" id="star_area1" style="display: block">
                                        <span class="starR1 on">별1_왼쪽</span>
                                        <span class="starR2 <% if (point2 >= 2) { %> on <% } %>">별1_오른쪽</span>
                                        <span class="starR1 <% if (point2 >= 3) { %> on <% } %>">별2_왼쪽</span>
                                        <span class="starR2 <% if (point2 >= 4) { %> on <% } %>">별2_오른쪽</span>
                                        <span class="starR1 <% if (point2 >= 5) { %> on <% } %>">별3_왼쪽</span>
                                        <span class="starR2 <% if (point2 >= 6) { %> on <% } %>">별3_오른쪽</span>
                                        <span class="starR1 <% if (point2 >= 7) { %> on <% } %>">별4_왼쪽</span>
                                        <span class="starR2 <% if (point2 >= 8) { %> on <% } %>">별4_오른쪽</span>
                                        <span class="starR1 <% if (point2 >= 9) { %> on <% } %>">별5_왼쪽</span>
                                        <span class="starR2 <% if (point2 >= 10) { %> on <% } %>">별5_오른쪽</span>
                                    </div>
                                </div>
                                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;">조회수 : </a><%=count %></div>
                            </div>
                            <hr>
                            <div id="content" style="margin:0 auto;width:40%;margin-top:3%;margin-bottom:2%;"><%=content.replace("& gt;", ">").replace("& lt;", "<").replace("& #39;", "'").replace("script", "") %></div>
                            <hr>
                            <div style="text-align:right;">
                                <%if(writer.equals(userEmail)||userAss.equals("1")) {%>
                                <form onsubmit="return BM()" action="/boardMod.do"style="display: inline;">
                                    <input type="hidden" value="<%=Seq %>" name="board_seq">
                                    <input type="submit"class="btn btn-primary" style="font-family:sans-serif;" value="수정">
                                </form>
                                <form onsubmit="return BM()" action="/boardDelete.do"style="display: inline;">
                                    <input type="hidden" value="<%=Seq %>" name="board_seq">
                                    <input type="submit"class="btn btn-danger" style="font-family:sans-serif;margin-left:2px;" value="삭제">
                                </form>
                                <%} %>
                                <button style="font-family:sans-serif;margin-left:2px;" class="btn btn-success" onclick="location.href='board.do?Pno=1'">목록</button>
                            </div>
                        </div>
                    </div>
                    <div class="de_default_area" style="margin:0 auto;width:70%;padding-top:5%;margin-bottom:10%;">
                        <p class="mc_title">댓글</p>
                    <div class="comment_area" id="comment_area">
                    <div style="width: 100%; padding-top: 0%; text-align:center; margin:0 auto">
                            <div class="my_grade_cont white_box eidit_box" id="gradeOutBox" style="display:block;">
                    <form onsubmit="return buhs()" action="/Board_ReviewAdd.do" method="post" id="review">
                        <div class="ag_cont_box">
                            <div class="ag_cont">
                                        <textarea name="gradeTxt" id="gradeTxt" placeholder="욕설, 비속어, 타인을 비방하는 문구를 사용하시면 운영자가 임의로 삭제할 수 있습니다.
최대 1,500자 작성가능(공백포함)"></textarea>
                                <input type="hidden" name="board_seq" id="board_seq" value="<%=Seq%>">
                                <button type="submit" class="btn_grade_add" id="btnReg">등록</button>
                            </div>
                        </div>
                    </form>
                            </div>
                        <% for (int i = 0; i < rList.size(); i++) {  %>
                        <div class="movie_grade_area" id="movie_grade_area" style="display: none">
                            <div class="all_grade_cont white_box" id="all_grade_cont_white_box">
                                <div class="ag_cont_box">
                                    <form action="/Board_reviewMod.do" id="rm<%=i%>" method="post">
                                        <div class="ag_cont" id="gradeList" style="text-align: start; padding-right: 0px;">
                                            <p class="ag_text" id="gradeListComment<%=i%>" style="display: block;"><%=rList.get(i).getContent().replace("& gt;", "&gt;").replace("& lt;", "&lt;").replace("& #39;", "& #39;").replace("& #40;", "&#40;").replace("& #41;", "&#41;")%></p>
                                            <textarea id="Rc<%=i%>" name="RMcontent" style="display: none;" placeholder="<%=rList.get(i).getContent().replace("& gt;", "&gt;").replace("& lt;", "&lt;").replace("& #39;", "& #39;").replace("& #40;", "&#40;").replace("& #41;", "&#41;")%>"></textarea>
                                            <p class="ag_writer"><span class="writer"><%=rList.get(i).getReg_id()%></span><span class="date"><%=rList.get(i).getReg_dt()%></span>
                                                <% if (rList.get(i).getChg_dt() != null) { %>
                                                <span class="writer"></span>
                                                <span class="date">최근수정일 : <%=rList.get(i).getChg_dt()%></span>
                                                <% } %>
                                            </p>
                                                <% if (user_seq.equals(rList.get(i).getUser_seq()) || userAss.equals("1")) {%>
                                            <div class="like_type" id="RS<%=i%>" style="display: none">
                                                <a style="float: right" onclick="return rModC(<%=i%>)">취소</a>
                                                &nbsp;
                                                <p style="float: right">/</p>
                                                &nbsp;

                                                <input type="hidden" name="board_seq" value="<%=Seq%>">
                                                <input type="hidden" id="" value="<%=rList.get(i).getContent()%>">
                                                <input type="hidden" name="review_seq" value="<%=rList.get(i).getReview_seq()%>">
                                                <a style="float: right" onclick="return RMOD(<%=i%>)">저장</a>
                                            </div>
                                    </form>
                                    <div class="like_type" id="RD<%=i%>" style="display: block">
                                        <form action="/Board_reviewDel.do" id="rd<%=i%>">
                                            <input type="hidden" name="Rno" value="<%=rList.get(i).getReview_seq()%>">
                                            <a style="float: right" onclick="return rDel(<%=i%>)">삭제</a>
                                            <input type="hidden" name="board_seq" value="<%=Seq%>">
                                            &nbsp;
                                            <p style="float: right">/</p>
                                            &nbsp;
                                            <a style="float: right" onclick="return rMod(<%=i%>)">수정</a>
                                    </div>
                                    <% } %>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                        <% } %>
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
    function BM(){
        var user="<%=userEmail%>";
        var ass="<%=userAss%>";
        var writer="<%=writer%>";
        if(user!=writer&&ass!="1"){
            alert("글 수정 및 삭제는 작성자 혹은 관리자만 가능합니다.");
            return false;
        }
    }
</script>

<script type="text/javascript">
    function buhs() {
        var content = document.getElementById("gradeTxt");
        if (content.value == "") {
            alert("내용을 입력해 주세요.");
            $('#gradeTxt').focus();
            return false;
        }
        if (<%=user_seq%> == "0") {
            alert("로그인 후 이용해주세요");
            $('#gradeTxt').focus();
            return false;
        }
    };
    function rDel(i){
        var result;
        console.log(i);
        result = confirm("리뷰를 삭제하시겠습니까?");
        console.log(result);
        if (result){
            $('#rd'+i).submit();
        }else{
            alert("취소되었습니다.");
        }
    };
    function rMod(i) {
        $('#gradeListComment'+i).attr('style','display:none;');
        $('#Rc'+i).attr('style','display:block;');
        $('#RD'+i).attr('style','display:none;');
        $('#RS'+i).attr('style','display:block;');
        $('#star_area1'+i).attr('style','display:none;');
        $('#star_mod'+i).attr('style','display:block;');
    };
    function rModC(i) {
        $('#gradeListComment'+i).attr('style','display:block;');
        $('#Rc'+i).attr('style','display:none;');
        $('#RD'+i).attr('style','display:block;');
        $('#RS'+i).attr('style','display:none;');
        $('#star_area1'+i).attr('style','display:block;');
        $('#star_mod'+i).attr('style','display:none;');
    };
    function RMOD(i) {
        var content = document.getElementById("Rc"+i);
        if (content.value == ""){
            alert("내용을 입력해주세요.")
            content.focus();
            return false;
        }
        $("#rm"+i).submit()
    }
    $(function () {
        $(".movie_grade_area").slice(0, 5).show();
        if ($(".movie_grade_area:hidden").length == 0) {
            $('#load').attr('style', "display:none;");
        }
        $("#load").click(function (e) {
            e.preventDefault();
            $(".movie_grade_area:hidden").slice(0, 5).show();
            if ($(".movie_grade_area:hidden").length == 0) {
                $('#load').attr('style', "display:none;");
            }
        })
    })

</script>

</body>

</html>


