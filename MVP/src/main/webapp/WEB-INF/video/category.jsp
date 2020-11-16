<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../audio/music_header.jsp"%>
<style>
    .category_title{
        text-transform: capitalize;
        margin-top: -40px;
        font-size: 30px;
        font-weight: bolder;
        display: flex;
        justify-content: center;
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
    <c:forEach items="${list}" var="flist">
        <input type="hidden" name="test" value='<c:out value="${flist.category}"/>'>
    </c:forEach>

    <div class="discs">
        <div class="container">
            <div class="category_title" id="category_title"> List</div>

            <div class="row discs_row">
                <!-- Disc -->
                <c:forEach items="${list}" var="list">
                    <div class="col-xl-4 col-md-6">
                        <div class="disc">
                                <div class="disc_image"><img src="/resources/static/img/disc_1.jpg" alt="https://unsplash.com/@tanelah"></div>
                                <div class="disc_container">
                                    <div>

                                        <div class="disc_content_1">
                                            <div class="disc_title">
                                                <a href='/video/watch?no=${list.no}&category=${list.category}' >
                                                    ${list.category}
                                                    <input type="hidden" value="${list.category}">
                                                    <c:out value="${list.title}" />
                                                </a>
                                            </div>
                                            <div class="disc_subtitle">
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

<script>
    $(document).ready(function () {
        var test = document.getElementsByName("test")[0].value;
        console.log(test);
        if (test) {
            $("#category_title").prepend(test);;
        } else {
            alert ("불러올 비디오 목록이 없습니다.");
        }
    });
</script>
<%@include file="../mvp/sidebar.jsp"%>