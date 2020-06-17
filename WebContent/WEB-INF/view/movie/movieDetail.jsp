<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="poly.dto.MovieDetailDTO" %>
<%@ page import="poly.dto.ReviewDTO" %>
<%@ page import="poly.dto.MyMovieDTO" %>
<%
    List<MovieDetailDTO> mList = (List<MovieDetailDTO>)request.getAttribute("mList");
    List<ReviewDTO> rList = (List<ReviewDTO>)request.getAttribute("rList");
    List<MyMovieDTO> yList = (List<MyMovieDTO>)request.getAttribute("yList");

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

    <title>Contact - Company Bootstrap Template</title>
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
</head>

<body>

<!-- ======= Header ======= -->
<%@include file="/include/header.jsp"%>
<!-- End Header -->

<main id="main">

    <div class="movie_area">
        <div class="detail_banner_area" id="movieDetail">
            <div class="bg_blur_area" style="display: block;">
                <!-- 선택된 영화 이미지 블러 효과 부분--> <svg class="svg_blur" xmlns="http://www.w3.org/2000/svg" version="1.1">
                <filter id="svgFilter" x="-0%" y="-0%">
                    <feGaussianBlur id="svgGaussBlur" in="SourceGraphic" stdDeviation="4"></feGaussianBlur>
                    <feComponentTransfer>
                        <feFuncA type="discrete" tableValues="1 1"></feFuncA>
                    </feComponentTransfer>
                </filter>
                <image xlink:href="<%=mList.get(0).getBackimg()%>"
                       filter="url(#svgFilter)" preserveAspectRatio="xMidYMin slice" width="100%" height="100%" x="0" y="0">
                </image>
            </svg> </div>
            <div class="detail_movie_info">
                <div class="img_thumb"><img src="<%=mList.get(0).getImage()%>"
                                            id="poster" alt=""></div>
                <div class="dm_info_txt">
                    <p id="movieTitle" class="dmb_tit"><%=mList.get(0).getTitle()%></p>
                    <p class="dmb_txt"><span><%=mList.get(0).getMv_info()%></span></p>
                    <p class="dmb_txt"><span>감독 | <%=mList.get(0).getDirector()%> </span><span>출연 | <%=mList.get(0).getActor()%> </span></p>
                    <input type="hidden" value="<%=mList.get(0).getMid()%>">
                    <% if (user_seq == "0") {}else { %>
                    <% if (yList.size() != 0) {%>
                    <form action="/mymovieDel.do" method="post">
                        <p class="dmb_txt"><input type="submit" class="btn_defaultB" value="나의 영화 등록취소"></p>
                        <input type="hidden" name="mid" value="<%=mList.get(0).getMid()%>">
                        <input type="hidden" name="mymovie_seq" value="<%=yList.get(0).getMymovie_seq()%>">
                    </form>
                    <% } else  { %>
                    <form action="/mymovieAdd.do" method="post">
                        <p class="dmb_txt"><input type="submit" class="btn_defaultB" value="나의 영화 등록"></p>
                        <input type="hidden" name="mid" value="<%=mList.get(0).getMid()%>">
                        <input type="hidden" name="title" value="<%=mList.get(0).getTitle()%>">
                        <input type="hidden" name="mv_info" value="<%=mList.get(0).getMv_info()%>">
                        <input type="hidden" name="director" value="<%=mList.get(0).getDirector()%>">
                        <input type="hidden" name="actor" value="<%=mList.get(0).getActor()%>">
                        <input type="hidden" name="image" value="<%=mList.get(0).getImage()%>">
                        <input type="hidden" name="backimg" value="<%=mList.get(0).getBackimg()%>">
                        <input type="hidden" name="h_context" value="<%=mList.get(0).getH_context()%>">
                        <input type="hidden" name="context" value="<%=mList.get(0).getContext()%>">
                    </form>
                    <% } } %>
                </div>
            </div>
        </div>

        <div class="movie_cont lay_inner">
            <div class="detail_cont" id="test">
                <div class="detaile_tab_area" id="movieInfoTabArea">
                    <div class="tab_container" id="DetailIndex">
                        <div class="de_default_area">
                            <!--줄거리-->
                            <p class="mc_title" id="IndexSynopsisTitle">줄거리</p>
                            <p class="syn_txt" id="synopsis"><b><%=mList.get(0).getH_context()%></b> <br><%=mList.get(0).getContext()%><br></p>
                            <!-- //줄거리-->
                        </div>
                    </div>
                    <div class="de_default_area">
                        <!--  평점-->
                        <p class="mc_title">평점</p>
                        <div class="comment_area" id="comment_area">
                            <div class="my_grade_cont white_box eidit_box" id="gradeOutBox" style="display:block;">
                                <form onsubmit="return buhs()" action="/ReviewAdd.do" method="post" id="review">
                                <div class="ag_cont_box">
                                    <div class="ag_top">
                                        <span class="agt_tit">나의 평점</span>
                                        <div class="star_area big eve_star_parent" id="myGradeA">
                                            <span class="ic_star big eve_star"><span class="bg_star"></span></span>
                                            <span class="ic_star big eve_star"><span class="bg_star"></span></span>
                                            <span class="ic_star big eve_star"><span class="bg_star"></span></span>
                                            <span class="ic_star big eve_star"><span class="bg_star"></span></span>
                                            <span class="ic_star big eve_star"><span class="bg_star"></span></span>
                                            <span class="star_num" id="myGradeStarNum">0</span>
                                        </div>
                                        <span class="agt_tit">종합 평점</span>
                                        <div class="star_area" id="totalGradeA"><span class="ic_star all_star"><span
                                                class="bg_star"></span></span><span class="ic_star all_star"><span
                                                class="bg_star"></span></span><span class="ic_star all_star"><span
                                                class="bg_star"></span></span><span class="ic_star all_star"><span
                                                class="bg_star"></span></span><span class="ic_star"><span
                                                class="bg_star"></span></span><span class="star_num" id="star_num">8.1</span></div>
                                    </div>
                                    <div class="ag_cont">
                                        <textarea name="gradeTxt" id="gradeTxt" placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요.
욕설, 비속어, 타인을 비방하는 문구를 사용하시면 운영자가 임의로 삭제할 수 있습니다.
최대 1,500자 작성가능(공백포함)"></textarea>
                                        <input type="hidden" name="mid" id="mid" value="<%=mList.get(0).getMid()%>">
                                        <button type="submit" class="btn_grade_add" id="btnReg">등록</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="my_grade_cont white_box" id="gradeInBox" style="display:none;">
                                <div class="ag_cont_box">
                                    <div class="ag_top">
                                        <span class="agt_tit">나의 평점</span>
                                        <div class="star_area" id="myGradeB"></div>
                                        <span class="agt_tit">종합 평점</span>
                                        <div class="star_area" id="totalGradeB">
                                        </div>
                                        <!-- 삭제버튼 -->
                                    </div>
                                    <div class="ag_cont">
                                        <p class="ag_text" id="gradeGradeNotes"></p>
                                        <p class="ag_writer"><span class="date" id="myRegDate"></span></p>
                                        <div class="like_box" id="likeBoxB">
                                            <div class="like_type">
                                                <button type="button" class="btn_like"><span class="ic_heart active"></span></button>
                                                <!--ic_heart에 active 클래스 제거시 디폴트로 변경-->
                                                <p class="like_count" id="upVoteB"></p>
                                            </div>
                                            <div class="like_type">
                                                <button type="button" class="btn_like"><span class="ic_b_heart active"></span></button>
                                                <!--ic__b_heart에 active 클래스 제거시 디폴트로 변경-->
                                                <p class="like_count" id="downVoteB"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% for (int i = 0; i < rList.size(); i++) { %>
                            <div class="movie_grade_area" id="movie_grade_area">
                                <div class="all_grade_cont white_box" id="all_grade_cont_white_box">
                                    <div class="ag_cont_box">
                                        <div class="ag_top">
                                            <div class="star_area" id="star_area1"><span class="ic_star all_star"><span
                                                    class="bg_star"></span></span><span class="ic_star all_star"><span
                                                    class="bg_star"></span></span><span class="ic_star all_star"><span
                                                    class="bg_star"></span></span><span class="ic_star all_star"><span
                                                    class="bg_star"></span></span><span class="ic_star half_star"><span
                                                    class="bg_star"></span></span><span class="star_num" id="star_num">9</span></div>
                                        </div>
                                        <div class="ag_cont" id="gradeList">
                                            <p class="ag_text" id="gradeListComment<%=i%>" style="display:block;"><%=rList.get(i).getContent()%></p>
                                            <form action="/reviewMod.do" id="rm<%=i%>" method="post">
                                            <textarea id="Rc<%=i%>" name="RMcontent" style="display: none" placeholder="<%=rList.get(i).getContent()%>"></textarea>
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

                                                    <input type="hidden" name="mid" value="<%=mList.get(0).getMid()%>">
                                                    <input type="hidden" id="" value="<%=rList.get(i).getContent()%>">
                                                <input type="hidden" name="review_seq" value="<%=rList.get(i).getReview_seq()%>">
                                                    <a style="float: right" onclick="return RMOD(<%=i%>)">저장</a>
                                            </div>
                                            </form>
                                            <div class="like_type" id="RD<%=i%>" style="display: block">
                                                <form action="/reviewDel.do" id="rd<%=i%>">
                                                    <input type="hidden" name="Rno" value="<%=rList.get(i).getReview_seq()%>">
                                                    <a style="float: right" onclick="return rDel(<%=i%>)">삭제</a>
                                                    <input type="hidden" name="mid" value="<%=mList.get(0).getMid()%>">
                                                </form>
                                                &nbsp;
                                                <p style="float: right">/</p>
                                                &nbsp;
                                                    <a style="float: right" onclick="return rMod(<%=i%>)">수정</a>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <!-- // 평점-->
                        <div class="btn_bottom_area" id="btnMore">
                            <button type="button" class="btn_defaultB" onclick="javascript: fnMore('Y');">더보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

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
    };
    function rModC(i) {
        $('#gradeListComment'+i).attr('style','display:block;');
        $('#Rc'+i).attr('style','display:none;');
        $('#RD'+i).attr('style','display:block;');
        $('#RS'+i).attr('style','display:none;');
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
</script>

</body>

</html>