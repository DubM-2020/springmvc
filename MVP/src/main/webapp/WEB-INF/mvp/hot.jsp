<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../audio/music_header.jsp" %>
<style>
    .discs {
        padding-top: 30px;
        padding-bottom: 30px;
    }
    .disc a::before {
        width: 0%;
        height: 0%;
    }

</style>

<div class="super_container">

    <!-- Home -->

    <div class="home">
        <div class="home_inner">
            <div class="parallax_background parallax-window" data-parallax="scroll"
                 data-image-src="/resources/static/img/contact.jpg" data-speed="0.8"></div>
            <div class="home_container">

                <div class="home_content text-center">
                    <div class="home_subtitle">MUSIC/VIDEO</div>
                    <div class="home_title">HOT 6</div>
                </div>
            </div>
        </div>
    </div>

    <div class="discs">
        <div class="container">
            <div class="row discs_row">

                <div style="width: 95%; border-bottom: 1px solid;">
                    <p style="font-size: 30px; margin-left: 40px;">Music</p>
                </div>
                <c:forEach items="${alist}" var="media">

                    <div style="display: flex; width: 370px; height: 150px; margin-right: 20px; margin-top: 40px;">
                        <div class="disc" style="width: 150px !important;">
                            <a href="/audio/music?no=${media.no}&singer=${media.singer}">
                                <div class="disc_image">
                                    <img src="/resources/audio/music_mp3img/${media.fileName}">
                                </div>

                            </a>
                        </div>
                        <div style="padding-left: 20px; height: 150px">
                            <a href="/audio/music?no=${media.no}&singer=${media.singer}">
                                <p style="font-size: 24px; font-weight: 600; margin: 0;line-height: 1.5em;">
                                ${media.title}
                                </p></a>
                            <p style="font-size: 16px; font-weight: 600; margin: 0;">
                                ${media.singer}
                            </p>
                            <p style="margin: 0; font-size: 14px;">
                                좋아요 : ${media.m_like}
                            </p>
                            <p style="margin: 0; font-size: 14px;">
                                조회수 : ${media.count}
                            </p>
                            <p style="margin: 0; font-size: 14px;">
                                장르 : ${media.category}
                            </p>
                        </div>
                    </div>

                </c:forEach>


                <div style="width: 95%; border-bottom: 1px solid; margin-top: 30px;">
                    <p style="font-size: 30px; margin-left: 40px;">Video</p>
                </div>
                <c:forEach items="${vlist}" var="media">

                    <div style="display: flex; width: 370px; margin-right: 20px; margin-top: 40px;">
                        <div class="disc" style="width: 150px !important;">
                            <a href="/video/watch?no=${media.no}&category=${media.category}">
                                <div class="disc_image">
                                    <img src="/resources/video/video_imgs/${media.fileName}">
                                </div>

                            </a>
                        </div>
                        <div style="padding-left: 20px;">
                            <a href="/video/watch?no=${media.no}&category=${media.category}">
                            <p style="font-size: 24px; font-weight: 600; margin: 0;">
                                ${media.title}
                            </p></a>
                            <p style="margin: 0; font-size: 14px;">
                                좋아요 : ${media.m_like}
                            </p>
                            <p style="margin: 0; font-size: 14px;">
                                조회수 : ${media.count}
                            </p>
                            <p style="margin: 0; font-size: 14px;">
                                장르 : ${media.category}
                            </p>
                        </div>
                    </div>

                </c:forEach>

            </div>
        </div>
    </div>

<%@include file="../mvp/sidebar.jsp" %>