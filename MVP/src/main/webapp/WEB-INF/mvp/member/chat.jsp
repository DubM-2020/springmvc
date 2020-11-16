<%--
  Created by IntelliJ IDEA.
  User: MM
  Date: 2020-10-25
  Time: 오후 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    body *{
        font-family: 'Do Hyeon', sans-serif;
    }
</style>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>MVP CHAT</title>
    <link rel="stylesheet" href="/resources/chat.css"/>
</head>
<body>

<div id="username-page">
    <div class="username-page-container">
        <form id="usernameForm" name="usernameForm">
            <div class="form-group">
                <input type="hidden" id="name" value="${user.username}">
            </div>
            <div class="form-group">
                <button type="submit" class="accent username-submit" style="    font-size: 65px;">채팅 시작하기</button>
            </div>
        </form>
    </div>
</div>

<div id="chat-page" class="hidden">
    <div class="chat-container">
        <div class="chat-header">
            <h2>MVP CHAT</h2>
        </div>
        <div class="connecting">
            연결중...
        </div>
        <ul id="messageArea">

        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                           class="form-control"/>
                    <button type="submit" class="primary">보내기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/resources/static/js/jquery-3.5.1.min.js"></script>
<script src="/resources/chat.js"></script>
</body>
</html>
<script>
    $(function () {
        $('.username-submit').submit();
    });
</script>
