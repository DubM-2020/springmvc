<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/static/css/styles/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <link rel="stylesheet" href="/resources/sweetalert2.min.css">
</head>
<style>
    .side_menu {
        margin-bottom: 20px;
        width: 50px
    }

    .btn-dark:hover {
        color: indianred;
    }

    .Admin:hover svg {
        color: crimson;
    }
</style>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

    body * {
        font-family: 'Do Hyeon', sans-serif;
    }
</style>
<body>
<div class="page-wrapper chiller-theme">

    <div class="show-sidebar">
        <a id="show-sidebar" class="btn btn-sm btn-dark side_menu" href="#" style="border-top-left-radius: 4px">
            <i class="fas fa-bars fa-2x"></i>
        </a>

        <a class="side_menu btn btn-sm btn-dark" href="/mvp/home">
            <i class="far fa-home-lg fa-2x"></i>
        </a>

        <a class="side_menu btn btn-sm btn-dark" href="/audio/music_list">
            <i class="far fa-music fa-2x"></i>
        </a>

        <a class="side_menu btn btn-sm btn-dark" href="/video/video_list">
            <i class="far fa-video fa-2x"></i>
        </a>
    </div>

    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
            <div class="sidebar-brand">
                <a href="/mvp/home">Music & Video Player</a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="sidebar-header">
                <div class="user-info">
          <span class="user-name">
              <div class="user-pic" style="text-align: center;">
                      <sec:authorize access="isAnonymous()">
                          <i class="fas fa-ghost fa-3x" style="color:white"></i>
                      </sec:authorize>
                      <sec:authorize access="hasRole('USER')">
                          <i class="fas fa-user fa-3x" style="color:white"></i>
                      </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <a href="/mvp/admin/home" class="Admin">
                        <i class="fas fa-user-tie fa-3x" style="color:white"></i>
                            </a>
                    </sec:authorize>
                </div>
            <sec:authorize access="isAnonymous()">
                <strong>GUEST</strong>
            </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                  <strong>${user.username}</strong>
              </sec:authorize>
          </span>
                    <span class="user-role" style="display: flex">
                    <sec:authorize access="isAnonymous()">
                        GUEST
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <c:set var="temp" value="${user.auth}"/>
                        <c:set var="auth" value="${fn:substring(temp,5,10 )}"/>
                        ${auth}
                    </sec:authorize>
                    </span>
                </div>
                <sec:authorize access="isAuthenticated()">
                    <a href="/mvp/member/modify"> <i class="fas fa-cog" style="float:right; font-size: 1.5em"></i></a>
                </sec:authorize>
            </div>
            <!-- sidebar-header  -->
            <div class="sidebar-search">
                <div>
                    <div class="input-group">
                        <form action="/search" id="newsletter_form" method="GET" style="width: 224px; position: relative;">
                            <input type="hidden" value="1" name="baseOpt">
                            <input type="search" class="form-control search-menu" placeholder="Search..."
                                   required="required" name="keyword">
                            <div class="input-group-append">
              <span class="input-group-text" style="position: absolute; right: 0; top: -34px;">
                <button style="display: contents;"><i class="fa fa-search" aria-hidden="true"></i></button>
              </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- sidebar-search  -->
            <div class="sidebar-menu">
                <ul>
                    <li class="header-menu">
                        <span>LIST</span>
                    </li>
                    <li>
                        <a href="/mvp/hot">
                            <i class="fad fa-fire"></i>
                            <span>Hot</span>
                        </a>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fas fa-music"></i>
                            <span>Music</span>
                            <span class="badge badge-pill badge-warning">NEW</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/audio/category?category=Ballad">Ballad</a>
                                </li>
                                <li>
                                    <a href="/audio/category?category=Dance">Dance</a>
                                </li>
                                <li>
                                    <a href="/audio/category?category=Hip-Hop">Hip-Hop</a>
                                </li>
                                <li>
                                    <a href="/audio/category?category=Band">Band</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fas fa-video"></i>
                            <span>Video</span>
                            <span class="badge badge-pill badge-danger">HOT</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/video/category?category=Entertainment">Entertainment</a>
                                </li>
                                <li>
                                    <a href="/video/category?category=Sport">Sport</a>
                                </li>
                                <li>
                                    <a href="/video/category?category=Dance">Dance</a>
                                </li>
                                <li>
                                    <a href="/video/category?category=MV">MV</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <div style="border-bottom: 1px solid #565c67; margin: 25px 0 10px 0;"></div>
                    <li class="header-menu">
                        <span>Content</span>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fad fa-list-alt"></i>
                            <span>PlayList</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="#">Music</a>
                                </li>
                                <li>
                                    <a href="#">Video</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fas fa-heart"></i>
                            <span>Like</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/mvp/best?sort=2">Music</a>
                                </li>
                                <li>
                                    <a href="/mvp/best?sort=4">Video</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fad fa-chart-bar"></i>
                            <span>MVPChart</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/mvp/best?sort=1">Music</a>
                                </li>
                                <li>
                                    <a href="/mvp/best?sort=3">Video</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <div style="border-bottom: 1px solid #565c67; margin: 25px 0 10px 0;"></div>
                    <li onclick="openPlayerSetting()">
                        <a href="#">
                            <i class="fas fa-turntable"></i>
                            <span>Player</span>
                        </a>
                    </li>
                    <li onclick="openChatSetting()">
                        <a href="#">
                            <i class="fas fa-comment"></i>
                            <span>Chat</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- sidebar-menu  -->
        </div>
        <!-- sidebar-content  -->
        <div class="sidebar-footer">
            <a href="#">
                <sec:authorize access="isAnonymous()">
                    <a href="/mvp/sign">
                        <i class="fad fa-sign-in-alt fa-2x"></i>
                    </a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <a href="#" onclick="document.getElementById('logout-form').submit()"><i
                            class="fas fa-power-off logout fa-2x"></i></a>
                    <form action="<c:url value="/logout"/>" id="logout-form" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </sec:authorize>
            </a>
        </div>
    </nav>
    <!-- page-content" -->
</div>
</body>
</html>

<script src="/resources/static/js/sidebar.js"></script>
<script src="/resources/sweetalert2.min.js"></script>
<script>
    function openChatSetting() {
        <sec:authorize access="isAuthenticated()">
        var url = '/chat';
        var width = 750;
        var height = 675;
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
        window.open(url, "MVP CHAT", option);
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
        Swal.fire({
            icon: 'error',
            title: '권한이 없습니다',
            text: '로그인을 진행해주세요',
            footer: '<a href="/mvp/sign">로그인을 하시겠습니까?</a>'
        })
        </sec:authorize>
    }

    function openPlayerSetting() {
        <sec:authorize access="isAuthenticated()">
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
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
        Swal.fire({
            icon: 'error',
            title: '권한이 없습니다',
            text: '로그인을 진행해주세요',
            footer: '<a href="/mvp/sign">로그인을 하시겠습니까?</a>'
        })
        </sec:authorize>
    }
</script>