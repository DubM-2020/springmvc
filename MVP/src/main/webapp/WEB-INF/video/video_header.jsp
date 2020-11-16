<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>MVP VIDEOS</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/bootstrap-4.1.2/bootstrap.min.css">
    <link href="/resources/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/responsive.css">
</head>
<html>
<body style="overflow-x:hidden; overflow-y:auto;" >
<div class="super_container" style="margin-top: 120px;">
    <!-- Header -->
        <header class="header" style="display: flex;">
            <div class="header_content d-flex flex-row align-items-center justify-content-center">
                <div class="logo"><a href="/mvp/home">MVP</a></div>
            </div>
            <div style="padding-right: 52px;">
                <form action="/search" id="newsletter_form" class="newsletter_form" method="GET">
                    <div style="width:450px; display: flex;">
                        <select name="baseOpt" style="width: 22%;font-size: 18px;">
                            <option value="1">&nbsp;&nbsp;전체</option>
                            <option value="2">&nbsp;&nbsp;뮤직</option>
                            <option value="3">&nbsp;&nbsp;비디오</option>
                        </select>
                        <input type="search" class="newsletter_input" placeholder="Search.."
                               required="required" name="keyword" style="height:40px; color:white; font-size: 20px">
                        <button type="submit" class="newsletter_button" style="height:40px">Search</button>
                    </div>
                </form>
            </div>
        </header>


    <%--===============================================--%>
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <link href="/resources/static/css/styles/about.css" rel="stylesheet" type="text/css">
    <link href="/resources/static/css/styles/about_responsive.css" rel="stylesheet" type="text/css">

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css'>

<%--===============================================--%>



    <script src="/resources/static/js/jquery-3.2.1.min.js"></script>
    <script src="/resources/static/js/jquery-ui.min.js"></script>
    <script src="/resources/static/css/styles/bootstrap-4.1.2/popper.js"></script>
    <script src="/resources/static/css/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
    <script src="/resources/static/js/TweenMax.min.js"></script>
    <script src="/resources/static/js/TimelineMax.min.js"></script>
    <script src="/resources/static/js/ScrollMagic.min.js"></script>
    <script src="/resources/static/js/animation.gsap.min.js"></script>
    <script src="/resources/static/js/ScrollToPlugin.min.js"></script>
    <script src="/resources/static/css/styles/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="/resources/static/js/easing.js"></script>
    <script src="/resources/static/js/progressbar.min.js"></script>
    <script src="/resources/static/js/parallax.min.js"></script>
    <script src="/resources/static/js/jPlayer/jquery.jplayer.min.js"></script>
    <script src="/resources/static/js/jPlayer/jplayer.playlist.min.js"></script>
    <script src="/resources/static/js/custom.js"></script>
    <script src="/resources/static/js/FontAwesome.js"></script>

    <script>
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        var lastScrollTop = 0;
        var easeEffect = 'easeInQuint';
        var timeout;

        $(document).ready(function (){
            $('#scroll2').scroll(function () { //스크롤 이벤트 발생
                console.log("문서크기:" + $('#scrollstart').height() + "|| 창크기:" + $('#scroll2').height()+
                    "||문서-창: " + ($('#scrollstart').height() - $('#scroll2').height()) + "|| 스크롤위치:"+$('#scroll2').scrollTop());
                var currentScrollTop = $('#scroll2').scrollTop();

                //다운 스크롤
                if (currentScrollTop - lastScrollTop > 0) {
                    console.log("down-scroll");


                    clearTimeout(timeout);
                    timeout = setTimeout(function() {
                        if (Math.ceil($('#scroll2').scrollTop())+0.5 >= parseInt($('#scrollstart').height() - $('#scroll2').height())) { //스크롤 동작 계산식

                            var lastbno = $(".scrolling:last").attr("data-no");
                            //마지막 bno값을 읽는다. ajax를 이용하여 서버로부터 다음 게시물을 받아온다.
                            $.ajax({
                                type: 'post',
                                url: '/audio/testscrolldown',
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader(header, token);
                                },
                                headers: {
                                    "Content-Type": "application/json",
                                    "X-HTTP-Method-Override": "POST"
                                },
                                dataType: 'json',
                                data: JSON.stringify({
                                    no: lastbno
                                }),
                                success: function (data) {
                                    var str = "";

                                    if (data != "") {
                                        $(data).each(
                                            function () {
                                                console.log(this);
                                                str += "<div class=" + "'col-xl-4 col-md-6 listToChange'" + ">"
                                                    + "<div class=" + "'disc'" + ">"
                                                    + "<input type=" + "'hidden'" + "class=" + "'scrolling'" + "data-no=" + this.no + ">"
                                                    + "<a href=" + "'/mvp/board/get?bno=" + this.no + "&singer=" + this.singer + "'" + ">"
                                                    + "<div class=" + "'disc_image'" + ">"
                                                    + "<img src=" + "'/resources/audio/music_img/cover/" + this.filename + "'"
                                                    + "alt=" + "'music cover images'" + " width=" + "'300px'" + " height=" + "'300px'" + ">"
                                                    + "</div>"
                                                    + "<div class=" + "'disc_container'" + ">"
                                                    + "<div>"
                                                    + "<div class=" + "'disc_content_1'" + ">"
                                                    + "<div class=" + "'disc_title'" + ">" + this.title + "</div>"
                                                    + "<div class=" + "'disc_subtitle'" + ">" + this.singer + "</div>"
                                                    + "</div>"
                                                    + "</div>"
                                                    + "</div>"
                                                    + "</a>"
                                                    + "</div>"
                                                    + "</div>"

                                            }); //each
                                        $(".scrollLocation").before(str);

                                    } //if
                                    else {
                                        console.log("noDATE");
                                    } //else

                                } //sucess
                            }); //ajax
                            var position = $(".listToChange:first").offset();
                            $('html,body').stop().animate({scrollTop: position.top + 10}, 600, easeEffect);
                        } //if: 현재 스크롤의 top 좌표가 > (게시글 화면 height-윈도창의 height)가 될때
                    },500);

                    lastScrollTop = currentScrollTop;
                } // 다운스크롤
            });
        });

    </script>

    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>