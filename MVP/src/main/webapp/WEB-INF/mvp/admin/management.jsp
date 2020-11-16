<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="header.jsp" %>
</div>
</div>
</div>
<html>
<head>
    <title>MANAGEMENT</title>
</head>
<body>
<h1 style="text-align: center">MEMBERS MANAGEMENT</h1>
<table class="table table-bordered table-hover text-center">
    <thead>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>REGDATE</th>
        <th>ENABLED</th>
        <th>DISABLE</th>
        <th>WITHDRAWAL</th>
    </tr>
    </thead>
    <tbody>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <c:forEach items="${user}" var="user" varStatus="cnt">
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td><fmt:formatDate value="${user.regDate}" pattern="yy.MM.dd"/></td>
        <c:choose>
            <c:when test="${user.enabled == 1}">
                <td name="status${cnt.count}">활성화</td>
            </c:when>
            <c:otherwise>
                <td name="status${cnt.count}">비활성화</td>
            </c:otherwise>
        </c:choose>
        <td><input type="button" class="btn btn-warning" value="정지" name="disable" data-num="${user.id}"
                   data-status="${user.enabled}" data-cnt="${cnt.count}"></td>
        <td><input type="button" class="btn btn-danger" value="삭제" name="withdrawal" data-num="${user.id}"></td>
    </tr>
    </tbody>
    </c:forEach>
</table>
</body>
</html>

<script>
    $(function () {

        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";

        function ajax(type, data, status, cnt) {
            var Uri;
            if (type == 'config') {
                Uri = '/mvp/admin/config';
            } else {
                Uri = '/mvp/admin/delete';
            }

            $.ajax({
                url: Uri,
                dataType: 'json',
                data: {
                    data: data
                },
                type: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (result) {
                    Swal.fire(
                        '성공',
                        '정상적으로 처리하였습니다',
                        'success'
                    ).then(function () {
                        if (type == 'delete') {
                            location.href = '/mvp/admin/manage';
                        }else if (type == 'config') {
                            if (status == 1) {
                                $('td[name=status' + cnt + ']').text('비활성화');
                            } else {
                                $('td[name=status' + cnt + ']').text('활성화');
                            }
                        }
                    })
                }
            });
        }

        $('input[name=disable]').click(function (e) {
            e.preventDefault();
            var temp = $(this).attr('data-num');
            var status = $(this).attr('data-status');
            var cnt = $(this).attr('data-cnt');

            if (status == 0) {
                $(this).attr('data-status', '1');
            } else {
                $(this).attr('data-status', '0');
            }
            ajax('config', temp, status, cnt);
        });

        $('input[name=withdrawal]').click(function (e) {
            var id = $(this).attr('data-num');

            success();

            function success() {
                Swal.fire({
                    title: '회원 삭제',
                    text: "정말 해당 회원을 삭제 하시겠습니까?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
                }).then((result) => {
                    if (result.isConfirmed) {
                        ajax('delete', id);
                    }
                })
            }
        });
    });

</script>


