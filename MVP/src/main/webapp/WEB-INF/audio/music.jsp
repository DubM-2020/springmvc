<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<sec:authentication property="principal.username" var="user"/>--%>

<%@include file="music_header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/audio/music_css/music_button.css">
<link rel="stylesheet" type="text/css" href="/resources/audio/music_css/music_playPause.css">
<link rel="stylesheet" type="text/css" href="/resources/audio/music_css/music_like.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<div class="super_container">

    <!-- Home -->

    <div class="home">
        <div class="home_inner">
            <!-- Image artist: https://unsplash.com/@yoannboyer -->
            <div class="parallax_background parallax-window" data-parallax="scroll"
                 data-image-src="/resources/static/img/disc_4.jpg" data-speed="0.8"></div>
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

                <input type="hidden" value='<c:out value="${media.no}" />'>
                <input type="hidden" value='<c:out value="${audio.no}" />'>
                <!-- Disc -->
                <div style="display: flex; padding-left: 17px;">
                    <div class="" style="width: 250px;">
                        <div>
                            <img src="/resources/audio/music_mp3img/${file.fileName}">
                            <p class="palyPaues" onclick="play()">
                                <audio id='audio_play' src='/resources/audio/music_mp3/${file2.fileName}'></audio>
                            </p>
                        </div>
                    </div>

                    <div class="badge_track_info">
                        <div>
                            <p class="badge_title">
                                <c:out value="${media.title}"/>
                            </p>
                            <p class="badge_artist">
                                <c:out value="${audio.singer}"/>
                            </p
                        </div>
                        <div>
                            <p class="title_artist">
                                <c:out value="${media.category}"/>
                            </p>
                        </div>

                        <div class="badge_list" style="padding-top: 10px;">
                            <nav style="padding-top: 15px;">
                                <ul>
                                    <li>
                                        <a href="/video/watch?no=${media.no+1000}&category=MV">
                                            <img src="/resources/audio/music_img/videowhite2.png"
                                                 style="width: 22px;" title="뮤직비디오">
                                        </a>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <a>
                                            <button class="btn" style="width: 45px; background-color: black;">
                                                <img src="/resources/audio/music_img/filewhite.png" title="가사 보기">
                                            </button>
                                            <div class="modal">
                                                <div class="modal-content">
                                                    <span class="modal_close">&times;</span>
                                                    <div style="display: flex;  padding: 0 0 40px 20px;">
                                                        <img src="/resources/audio/music_mp3img/${file.fileName}"
                                                             style="width: 130px;">
                                                        <div style="padding-left: 20px; padding-top: 25px; color: black;">
                                                            <h3 style="font-size: 20px;"><c:out
                                                                    value="${media.category}"/></h3>
                                                            <a style="font-size: 16px;font-weight:400; float: left; padding-top: 15px;">
                                                                <c:out value="${audio.singer}"/>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <p style="font-size: 16px;float: left; padding-left: 20px; font-weight: 400; color: black;">
                                                        ${audio.content}
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <a>
                                            <a href="/resources/audio/music_mp3/${file2.fileName}" download>
                                                <img src="/resources/audio/music_img/downloadwhite.png"
                                                     style="width: 22px;" title="다운로드">
                                            </a>
                                        </a>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <a>
                                            <form method="post">
                                                <ul class="actions" style="float: right; display: inline-flex; ">

                                                    <sec:authorize access="isAuthenticated()">
                                                        <a href='javascript: like_func();' title="좋아요">
                                                            <c:choose>
                                                                <c:when test="${like==null || like==0}">
                                                                    <i class="far fa-heart fa-2x" id="like_img"
                                                                       style="color: white;font-size: 1.5em; "></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fas fa-heart fa-2x" id="like_img"
                                                                       style="color: red; font-size: 1.5em;"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </a>
                                                    </sec:authorize>

                                                    <sec:authorize access="isAnonymous()">
                                                        <a href='javascript: login_need();' title="좋아요"><img
                                                                src='/resources/audio/music_img/heartwhite.png'
                                                                style="width: 20px;"></a>
                                                    </sec:authorize>
                                                    <br><span id='like_cnt' style='margin-left: 5px;'>
                                                    <c:out value="${media.m_like}"/>
                                                 </span>
                                                </ul>
                                            </form>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tubelight">
                                    <div class="light-ray"></div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="shows_list_container">
                <div class="track_head">

                    <div class="track_head2">
                        <button class="button" title="선택된 곡 듣기"
                                onclick="PlayerCheckSetting();">
                            <img class="track_head_list2" src="/resources/audio/music_img/playBlack.png">
                            <span class="track_head_span">듣기</span>
                        </button>
                    </div>

                    <div class="track_head2">
                        <button class="button" type="button" title="선택된 곡 담기"
                                onclick="PlayerCheckSetting();">
                            <img class="track_head_list2" src="/resources/audio/music_img/upload3.png">
                            <span class="track_head_span">담기</span>
                        </button>
                    </div>

                </div>

                <ul class="shows_list">
                    <!-- Show -->
                    <li class="d-flex flex-row align-items-center justify-content-start"
                        style=" height: 45px; background-color: #848484;color: #292929;font-weight: 600;">
                        <input type="checkbox" id="checkAll" onclick="cAll();">

                        <div class="show_info d-flex flex-md-row flex-column align-items-md-center
                    align-items-start justify-content-md-start justify-content-center" style="padding-left: 20px;">
                            <div style="display: flex; width: 100%; font-size: 15px;">
                                <div class="" style="width: 8%;">
                                    <a>번호</a>
                                </div>
                                <div class="" style="width: 6%">
                                    <a></a>
                                </div>
                                <div class="" style="width: 50%;">
                                    <a>곡정보</a>
                                </div>
                                <div class="" style="width: 35%;">
                                    <a>아티스트</a>
                                </div>
                                <div class="" style="width: 10%;">
                                    <a>듣기</a>
                                </div>
                                <div class="" style="width: 10%;">
                                    <a>담기</a>
                                </div>
                                <div class="" style="width: 10%;">
                                    <a>다운</a>
                                </div>
                                <div class="" style="width: 5%;">
                                    <a>뮤비</a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <sec:authorize access="isAnonymous()">
                        <a style="font-size: 15px;">로그인 후 이용해 주세요</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">

                    <c:forEach items="${singList}" var="list" varStatus="status">
                        <form method="post" action="/audio/music" name="frm" id="subForm">
                            <input name="id" type="hidden" value='<sec:authentication property="principal.username"/>'>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <li class="d-flex flex-row align-items-center justify-content-start">
                                <div>
                                    <input name="audio_no" type="hidden" value="${list.no}">
                                    <input name="singer" value="${list.singer}" type="hidden"/>
                                    <input name="no" type="checkbox" value="${list.no}"/>
                                </div>

                                <div class="show_info d-flex flex-md-row flex-column align-items-md-center
                                align-items-start justify-content-md-start justify-content-center"
                                     style="padding-left: 20px;">
                                    <div style="display: flex; width: 100%; font-size: 16px;">

                                        <div class="" style="width: 5%; padding-top: 6px;">
                                                ${status.count}
                                        </div>

                                        <div class="" style=" width: 5%;">
                                            <a class="btn"
                                               style=" background-color:#333232; padding-top: 11px;">
                                                <img src="/resources/audio/music_img/lyrics.png"
                                                     style="width: 15px;" title="가사 보기">
                                            </a>
                                            <div class="modal">
                                                <div class="modal-content">
                                            <span class="modal_close"
                                                  style="padding-left: 400px; CURSOR:hand;">&times;</span>
                                                    <div style="display: flex; padding: 0 0 40px 20px; ">
                                                        <img src='/resources/audio/music_mp3img/${list.fileName}'
                                                             style="width: 130px;">
                                                        <div style="padding-left: 20px; padding-top: 25px; color: black;">
                                                            <h3 style="font-size: 20px;"><c:out value="${list.title}"/></h3>
                                                            <a style="font-size: 16px;font-weight:400; float: left; padding-top: 15px;">
                                                                <c:out value="${list.singer}"/>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <p style="font-size: 16px;float: left; padding-left: 20px; font-weight: 400; color: black;">
                                                            ${list.content}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="" style="width: 38%; padding-top: 6px;">
                                            <div>
                                                <a href='/audio/music?no=${list.no}&singer=${list.singer}'>
                                                        ${list.title}
                                                </a>
                                            </div>
                                        </div>
                                        <div class="" style="width: 26%; display: flex; padding-top: 6px;">
                                            <p>
                                                <c:out value="${list.singer}"/>
                                            </p>
                                        </div>
                                        <div style="width: 78px; padding-right: 20px;">
                                            <button class="form_button" id="play-video"
                                                    onclick="openWin('/audio/music_player','0'); "
                                                    style="padding-top: 4px;"
                                                    formaction="/audio/music"
                                                    formmethod="post"
                                                    name="BTN${status.count}">
                                                <img style="width: 20px;"
                                                     src="/resources/audio/music_img/playBlack.png">
                                            </button>
                                        </div>
                                        <div style="width: 78px;">
                                            <button class="form_button" type="submit"
                                                    onclick="openWin('/audio/music_player','0')"
                                                    style="padding-top: 4px;">
                                                <img style="width: 20px;"
                                                     src="/resources/audio/music_img/upload.png">
                                            </button>
                                        </div>

                                        <div class="" style="width: 8%;padding-top: 4px;">
                                            <a href="/resources/audio/music_mp3/${list.pmp3}" download>
                                                <img style="width: 20px;"
                                                     src="/resources/audio/music_img/download1.png">
                                            </a>
                                        </div>
                                        <div class="" style="width: 3%;padding-top: 4px; ">
                                            <a href="/video/watch?no=${list.no+1000}&category=MV">
                                                <img style="width: 20px;"
                                                     src="/resources/audio/music_img/videoWhite.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <input name="noList" type="hidden" id="noList" value="">
                        </form>
                    </c:forEach>
                </ul>
            </div>
            </sec:authorize>
        </div>
    </div>
</div>

</body>
</html>
<%@include file="../mvp/sidebar.jsp" %>

<script src="/resources/audio/music_js/music_about.js"></script>
<script src="/resources/audio/music_js/music_list.js"></script>
<script src="/resources/audio/music_js/music_main.js"></script>
<script src="/resources/audio/music_js/music_playPause.js"></script>

<script>
    function like_func() {

        var frm_read = $('#frm_read');
        var media_no = $('#media_no', frm_read).val();
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        media_no = ${media.no};
        var id;
        id = 'id';
        <sec:authorize access="isAuthenticated()">
        id = '${user.username}';
        </sec:authorize>

        $.ajax({
            url: "/history_like/like",
            type: "POST",
            cache: false,
            dataType: "json",
            data: 'media_no=' + media_no + '&id=' + id,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                var msg = '';
                var like_img = '';
                msg += data.msg;

                if (data.like_check == 0) {
                    $('#like_img').attr('class', 'far fa-heart fa-2x').css('color', 'white');
                } else {
                    $('#like_img').attr('class', 'fas fa-heart fa-2x').css('color', 'red');
                }
                $('#like_cnt').html(data.like_cnt);
                $('#like_check').html(data.like_check);
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function login_need() {
        var flag = confirm("좋아요는 로그인이 필요합니다 로그인을 하시겠습니까?");

        if (flag) {
            //yes
            location.replace("/mvp/sign");
        } else {
            //no
        }
    }

    function PlayerCheckSetting() {

        <sec:authorize access="isAuthenticated()">

        if ($("input[type=checkbox]").is(":checked")) {
            var agree = confirm("곡을 재생하시겠습니까?");

            if (agree) {
                var arrayParam = new Array();
                $("input[name=no]:checked").each(function () {
                    var test = $(this).val();
                    arrayParam.push($(this).val());
                });
                $('#noList').val(arrayParam);
                $("#subForm").submit();

                var url = '/audio/music_player';
                var width = 500;
                var height = 620;
                var popupX = (window.screen.width / 2) - (width / 2);
                var popupY = (window.screen.height / 2) - (height / 2);
                var option = 'width=' + width + ',height=' + height + 'resizable=no' +
                    'top=' + popupX + ',' +
                    'left=' + popupY + ',' +
                    'screenX=' + popupX + ',' +
                    'screenY=' + popupY + ',' +
                    'scrollbars=yes,' +
                    'toolbar=no,' +
                    'menubar=no';
                window.open(url, "MVP PLAYER", option);
            }
        } else {
            alert("체크박스가 체크되어있지 않습니다.");
        }

        </sec:authorize>
        <sec:authorize access="isAnonymous()">
        alert("로그인이 필요합니다");




        </sec:authorize>
    }

</script>
