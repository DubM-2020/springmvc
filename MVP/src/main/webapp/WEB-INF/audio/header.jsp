<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<!DOCTYPE html>--%>

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

    <link href="/resources/static/css/styles/about.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
    <link href="/resources/audio/music_css/music_main.css" rel="stylesheet" type="text/css">
    <link href="/resources/audio/music_css/music_modal.css" rel="stylesheet" type="text/css">
    <link href="/resources/audio/music_css/music_list.css" rel="stylesheet" type="text/css">
    <link href="/resources/audio/music_css/music_about.css" rel="stylesheet" type="text/css">
    <link href="/resources/audio/music_css/music_style.css" rel="stylesheet" type="text/css">
    <link href="/resources/static/css/styles/about.css" rel="stylesheet" type="text/css">
    <link href="/resources/static/css/styles/about_responsive.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css'>

</head>
<html>
<body style="height: 100vh">
<style>
    .discs {
        padding-top: 33px;
        padding-bottom: 0px;
    }
    #scroll2 {
        margin-top: 0px;
        height: 60vh;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .row discs_row{
        margin-top: 0px;
    }
    .col-md-6{
        margin-bottom: 42px;
    }
    .disc_cover{
        position: relative;
        display: inline-block;
    }
    .disc_cover .disc_cover_file{
        width: 290px;
        height: 290px;
    }
    .disc_cover_text{
        color: #ffffff;
        cursor: pointer;
        font-size: 15px;
        align-self: center;
        transition: color 0.2s ease-in-out;
        position: absolute;
        height: 20%;
        text-align: center;
        vertical-align: bottom;
        width: 100%;
        padding-top: 3px;
        margin: auto;
        top: 233px;
        bottom: 0;
        right: 0;
        left: 0;
        background-color: rgba(0,0,0,0.6);
    }
    .disc_cover_text .disc_title {
        font-size: 1.3em;
        font-weight: bolder;
        /* text-shadow: 0.5px 0.5px 1px #f2ff2a; */
        color: #ffffff;
    }
    .disc_cover_text .disc_subtitle {
        color: #ffffff;
        /* text-shadow: 1px 1px 0px #000000; */
    }

    .disc_content_1{
        color: #ffffff;
        cursor: pointer;
        font-size: 14px;
        align-self: center;
        transition: color 0.2s ease-in-out;
    }
    .disc_content_1 .disc_title {
        font-size: 1.5em;
    }
    .disc a::before {
        width: 0%;
        height: 0%;
    }

</style>

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



<input type="hidden" name="${_csrf.parameterName}"
       value="${_csrf.token}"/>

<div class="super_container">

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