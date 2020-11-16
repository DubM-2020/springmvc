<%@ page language="java"  pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication property="principal" var="member"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">

<link rel="icon" href="/resources/static/admin/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/static/admin/icon/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/resources/static/admin/icon/icofont/css/icofont.css">

<link rel="stylesheet" href="/resources/static/admin/bootstrap.min.css">
<link rel="stylesheet" href="/resources/static/admin/style.css">
<link rel="stylesheet" href="/resources/sweetalert2.min.css">
<script src="/resources/static/js/jquery-3.5.1.min.js"></script>
<script src="/resources/static/admin/bootstrap.min.js"></script>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">

        <nav class="navbar header-navbar pcoded-header">
            <div class="navbar-wrapper">

                <div class="navbar-container container-fluid">
                    <ul class="nav-left">
                        Home
                    </ul>
                    <ul class="nav-right">
                        <li class="user-profile header-notification">
                            <a href="#!">
                                <i>IMAGE</i>
                                <span>${member.username}</span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                <li>
                                    <a href="/mvp/admin/home">
                                        <i class="ti-settings"></i> ADMIN
                                    </a>
                                </li>
                                <li>
                                    <a href="/mvp/home">
                                        <i class="ti-lock"></i> MVP
                                    </a>
                                </li>
                                <li>
                                    <a href="/logout">
                                        <i class="ti-layout-sidebar-left"></i> Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <script src="/resources/static/js/jquery-3.5.1.min.js"></script>
        <script src="/resources/static/admin/bootstrap.min.js"></script>
        <script src="/resources/static/js/FontAwesome.js"></script>
        <script src="/resources/sweetalert2.min.js"></script>