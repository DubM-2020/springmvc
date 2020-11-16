<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../video/video_header.jsp"%>

<style>
    .disc a {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        position: relative;
        color: #fde6e6;
    }
    .row discs_row{
        margin-top: 200px;
        height: 66vh;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .col-md-6{
        margin-bottom: 42px;
    }
    .disc_cover{
        position: relative;
        display: inline-block;
    }

    .disc_cover .disc_cover_file{
        width: 285px;
        height: 285px;
    }
    .disc_cover_text{
        color: #ffffff;
        cursor: pointer;
        font-size: 15px;
        align-self: center;
        transition: color 0.2s ease-in-out;
        position: absolute;
        height: 22%;
        text-align: center;
        vertical-align: bottom;
        width: 100%;
        padding-top: 3px;
        margin: auto;
        top: 224px;
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
        background:linear-gradient(to right,black,gray);
        opacity: 0.8;
        width: 87%;
        bottom:0;
    }
    .disc_content_1 .disc_title {
        font-size: 1.5em;
    }
    .fas{
        background: linear-gradient(to right, #fbcac9, #8ca6ce);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    .col-xl-4 .disc_image img {
        width: 360px;
        height: 230px;
    }

</style>

<div class="super_container">
    <!-- Home -->
    <div class="home">
        <div class="home_inner">
            <!-- Image artist: https://unsplash.com/@yoannboyer -->
            <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="/resources/static/img/about.jpg" data-speed="0.8"></div>
            <div class="home_container">
                <div class="home_content text-center">
                    <div class="home_subtitle">Just us</div>
                    <div class="home_title">Discography</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Discs -->
    <div class="discs">
        <div class="container">
            <div class="row discs_row">
                <!-- Disc -->
                <c:forEach items="${video}" var="vlist">
                    <div class="col-xl-4 col-md-6">
                        <div class="">
                            <div class="disc_image"><img src="/resources/video/video_imgs/${vlist.fileName}" alt="https://unsplash.com/@tanelah"></div>
                            <div class="disc_container">
                                <div>
                                    <div class="disc_play" style="text-align: center; top: 95px; font-size: 40px;">
                                        <a href='/video/watch?no=${vlist.no}&category=${vlist.category}' ><i class="far fa-play" style="color:#ff00a5;"></i></a>
                                    </div>
                                    <div class="disc_content_1">
                                        <div class="disc_subtitle">
                                        </div>
                                        <div class="disc">
                                            <div class="disc_title">
                                                <a href='/video/watch?no=${vlist.no}&category=${vlist.category}' >
                                                        ${vlist.category}
                                                    <input type="hidden" value="${vlist.category}">
                                                    <c:out value="${vlist.title}" />
                                                </a>
                                            </div>
                                            <div class="disc_subtitle">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Artist -->
    <!-- Footer -->
</div>

<%@include file="../mvp/sidebar.jsp"%>