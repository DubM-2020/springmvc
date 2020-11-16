<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="music_header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/audio/music_css/music_playPause.css">
<link rel="stylesheet" type="text/css" href="/resources/audio/music_css/music_like.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<style>
    .super_container{
        height: 100vh;
    }
    .category_title{
        margin-top: -40px;
        font-size: 30px;
        font-weight: bolder;
        display: flex;
        justify-content: center;
    }
    .discs{
        margin-top: 20px;
        padding-top: 65px;
        padding-bottom: 0px;
    }
    .discs_row{
        margin-top: 20px;
        height: 55vh;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .col-md-6{
        margin-bottom: 42px;
    }
    .disc_image .disc_image_file{
        width: 252px;
        height: 252px;
    }
    .disc_category{
        position: relative;
        display: inline-block;
    }
    .category_image_file{
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
    .disc a::before {
        width: 0%;
        height: 0%;
    }
</style>

<div class="super_container">

    <div class="home">
        <div class="home_inner">
            <!-- Image artist: https://unsplash.com/@yoannboyer -->
            <div class="parallax_background parallax-window" data-parallax="scroll"
                 data-image-src="/resources/static/img/featured_album.jpg" data-speed="0.8"></div>
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
            <div class="category_title" id="category_title"> MUSIC LIST !!</div>

            <div class="row discs_row">
                <!-- Disc by DB -->
                <c:forEach items="${list}" var="mclist">

                    <div class="col-xl-4 col-md-6">
                        <div class="disc">
                            <a href="/audio/music?no=${mclist.no}&singer=${mclist.singer}">
                                <div class="disc_category">
                                    <img class='category_image_file' src="/resources/audio/music_mp3img/${mclist.fileName}"
                                         alt="music cover images" >
                                    <div class="disc_cover_text">
                                        <div class="disc_title">${mclist.title}</div>
                                        <div class="disc_subtitle">${mclist.singer}</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <input type="hidden" class="category_text" value="${mclist.category}">
                </c:forEach>
                <%-- go top button--%>
                <a id="go_top"
                   style="position: fixed; bottom: 40px; right: 40px; z-index: 99999999;" title="Top">
                    <img src="https://tistory1.daumcdn.net/tistory/3542020/skin/images/top.png"
                         border="0"></a>

            </div>
        </div>
    </div>


</div>

<script>

    $(document).ready(function () { //url 값 가져오는 메소드
        console.log(location.search);
        var patId = getParameterByName('category');
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        console.log(patId);
        var text_test = patId + " List";
        document.getElementById('category_title').innerHTML=text_test;

    });

</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#go_top").hide();
        $('.discs_row').scroll(function () {
            if ($('.discs_row').scrollTop() > 80) {
                $("#go_top").fadeIn();
            } else {
                $("#go_top").fadeOut();
            }
        });
    });
    $('.discs_row').scroll(function () {
        console.log($('.discs_row').scrollTop());
    });

    $('#go_top').on("click", function (e) {
        console.log("위로버튼 클릭");
        e.preventDefault();
        $(".discs_row").scrollTop(0);
    });
</script>






<%@include file="../mvp/sidebar.jsp"%>
<%@include file="../mvp/footer.jsp"%>