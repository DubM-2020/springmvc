<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sec:authentication property="principal" var="user"/>
<c:set var="temp" value="${user.auth}"/>
<c:set var="auth" value="${fn:substring(temp,5,10 )}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/static/css/sign.css">
</head>
<body>
<div class="container" id="container" style="width: 450px;">
    <div class="form-container sign-in-container" style="width: 100%;">
        <form role="form" action="/modifyAction" method="POST">
            <h1>Modify</h1>
            <input type="text" name='id' value="${user.username}" readonly/>
            <input type="password" placeholder="PASSWORD" name='pwd'/>
            <input type="text" name='name' value="${user.name}" readonly/>
            <input type="email" placeholder="EMAIL" name='email'/>
            <span>
            <label>생성일자</label><input type="text" value="<fmt:formatDate value="${user.regDate}"/>" readonly/>
            </span>
            <span>
            <label>권한</label><input type="text" value="${auth}" readonly/>
            </span>
            <%--<span>
            <label>아이콘</label>
                ${user.icon}
            </span>--%>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div>
            <button type="submit">수정</button>
            <button onclick='history.go(-1); return false;'>뒤로가기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script src="/resources/static/js/jquery-3.5.1.min.js"></script>
<script src="/resources/static/js/sign.js"></script>
<script src="/resources/static/js/FontAwesome.js"></script>