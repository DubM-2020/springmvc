<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<head>
    <title>MVP</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/bootstrap-4.1.2/bootstrap.min.css">
    <link href="/resources/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/styles/responsive.css">
</head>
<body style="height: 100vh">

<script src="/resources/static/js/jquery-3.2.1.min.js"></script>
<script src="/resources/static/js/jquery-ui.min.js"></script>
<script src="/resources/static/css/styles/bootstrap-4.1.2/popper.js"/>
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
                            url: '/mvp/testscrolldown',
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