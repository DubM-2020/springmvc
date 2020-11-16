<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MVP SIGN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/sign.css">
    <link rel="stylesheet" href="/resources/sweetalert2.min.css">
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

    body * {
        font-family: 'Do Hyeon', sans-serif;
    }
</style>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form role="form" action="/signUp" method="POST" id="frm">
            <h1>Account</h1>
            <span style="display: flex; width:100%; font-size: 12px;">
                <input type="text" placeholder="ID" name='id' id="id"/>
                <i class="fas fa-check fa-2x" style="align-self: center;margin-left:5px; color:gray;"></i>
            </span>
            <div class="check_font" id="id_check"></div>
            <input type="password" placeholder="PASSWORD" name='pwd' id="pwd"/>
            <div class="check_font" id="pw_check"></div>
            <input type="password" placeholder="PASSWORD CHECK" name='pwd2' id="pwd2"/>
            <div class="check_font" id="pw_check2"></div>
            <input type="text" placeholder="NAME" name='name' id="name"/>
            <div class="check_font" id="name_check"></div>
            <input type="email" placeholder="EMAIL" name='email' id="email"/>
            <div class="check_font" id="email_check"></div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="button" id="singUpBtn">Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/loginProcess" method="POST">
            <div class="logo">
                <a href="/mvp/home">MVP</a>
            </div>
            <h1>Login</h1>
            <input type="text" placeholder="ID" name='login_id'/>
            <input type="password" placeholder="PASSWORD" name='login_pwd'/>
            <span style="display: inherit; width:50%">
                <input name="remember-me" type="checkbox" style="width:30px; margin:3px 2px 20px 0;">
                <label style="width:300px">Remember Me</label>
            </span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div style="display: inline-flex;">
                <button type="submit" style="margin-right: 10px;">Sign In</button>
                <button type="button" onclick='history.go(-1); return false;'>뒤로가기</button>
            </div>
            <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                <font color="red">
                    <p style="font-size: 21px;">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
                    <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
                </font>
            </c:if>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>감사합니다</h1>
                <p>좋은 하루 보내시기 바랍니다</p>
                <button class="ghost" id="signIn">Login</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>환영합니다</h1>
                <p>처음 방문하셨으면 버튼을 눌러<br>
                    회원가입을 진행해주세요</p>
                <button class="ghost" id="signUp">Account</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/sign.js"></script>
<script src="/resources/sweetalert2.min.js"></script>
<script src="/resources/static/js/FontAwesome.js"></script>
<script>
    //정규식
    var idJ = /^[a-z0-9]{4,12}$/;
    var nameJ = /^[가-힣]{2,6}$/;
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    //----
    var check = false;
    var inval_check = new Array(2).fill(false);

    $("#id").blur(function () {
        var id = $('#id').val();
        $.ajax({
            url: '${pageContext.request.contextPath}/idCheck?id=' + id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data == 1) {
                    $("#id_check").text("사용중인 아이디입니다 :p");
                    $("#id_check").css("color", "red");
                    $('.fa-check').css('color', 'red');
                    $("#signUpBtn").attr("disabled", true);
                } else {
                    if (idJ.test(id)) {
                        $("#id_check").text("");
                        $("#signUpBtn").attr("disabled", false);
                        check = true;
                    } else if (id == "") {
                        $('#id_check').text('아이디를 입력해주세요 :)');
                        $('#id_check').css('color', 'red');
                        $("#signUpBtn").attr("disabled", true);
                        $('.fa-check').css('color', 'red');
                        check = false;
                    } else {
                        $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
                        $('#id_check').css('color', 'red');
                        $("#signUpBtn").attr("disabled", true);
                        $('.fa-check').css('color', 'red');
                        check = false;
                    }
                    if (check == true && data == 0)
                        $('.fa-check').css('color', '#00d900');
                }
            }, error: function () {
                console.log("실패");
            }
        });
    });
    $("#pwd").blur(function () {
        if (pwJ.test($('#pwd').val())) {
            $("#pw_check").text('');
        } else {
            $('#pw_check').text('숫자 or 문자로만 4-12자리 입력');
            $('#pw_check').css('color', 'red');
        }
    });
    $("#pwd2").blur(function () {
        if ($('#pwd').val() != $(this).val()) {
            $('#pw_check2').text('비밀번호를 확인해주세요');
            $('#pw_check2').css('color', 'red');
        } else {
            $("#pw_check2").text('');
        }
    });
    $("#name").blur(function () {
        if (nameJ.test($(this).val())) {
            $("#name_check").text('');
        } else {
            $('#name_check').text('이름을 확인해주세요');
            $('#name_check').css('color', 'red');
        }
    });

    $("#email").blur(function () {
        if (mailJ.test($(this).val())) {
            $('#email_check').text('');
        } else {
            $('#email_check').text('이메일을 확인해주세요 (ex:example@example.com)');
            $('#email_check').css('color', 'red');
        }
    });

    $('#singUpBtn').click(function () {
        if (($('#pwd').val() == ($('#pwd2').val()))
            && pwJ.test($('#pwd').val())) {
            inval_check[0] = true;
        } else {
            inval_check[0] = false;
        }
        if (nameJ.test($('#name').val())) {
            inval_check[1] = true;
        } else {
            inval_check[1] = false;
        }

        if (mailJ.test($('#email').val())) {
            inval_check[2] = true;
        } else {
            inval_check[2] = false;
        }

        var checkedAll = true;
        for (var i = 0; i < inval_check.length; i++) {
            if (inval_check[i] == false) {
                checkedAll = false;
            }
        }
        if (!checkedAll) {
            alert("입력 정보를 확인해주세요");
            return false;
        } else {
            success();
        }
    });

    function success() {
        Swal.fire(
            '가입 성공!',
            '회원이 되신걸 환영합니다.',
            'success',
        ).then(function () {
            document.getElementById('frm').submit();
        });
    }

    /*$("#frm").attr("action", "/signUp");
    $('#frm').submit();
    return true;*/

</script>