<%@include file="header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

    body * {
        font-family: 'Do Hyeon', sans-serif;
    }

    .admin_audio_list {
        font-size: 14px;
        margin: 5px;
        background-color: #f6f7fb;
        width: 100%;
        box-shadow: 0 1px 11px 0 rgba(0, 0, 0, 0.12);
        display: inline-block;
    }

    .admin_media_list {
        float: right;
        display: inline-block;
        font-size: 14px;
        margin: 5px;
        background-color: #f6f7fb;
        width: 100%;
        box-shadow: 0 1px 11px 0 rgba(0, 0, 0, 0.12);
    }

    .admin_audio_sub {
        display: inline-block;
        font-size: 20px;
        text-align: start;
    }

    .admin_media_sub {
        display: inline-block;
        font-size: 20px;
        text-align: start;
    }

</style>
<script>
    var formObj = $("form");

    $('button').on("click", function (e) {

        e.preventDefault();

        var operation = $(this).data("oper");

        console.log(operation);

        formObj.attr("action", "/remove");

        formObj.submit();
    });

</script>
<body>
<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">

                        <div class="page-body">
                            <div class="row">
                                <!-- card1 start -->
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3" style="max-width: 50%; flex: 0 0 50%">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-ui-home bg-c-pink card1-icon"></i>
                                            <span class="text-c-pink f-w-600">MEDIA</span>
                                            <a href="/mvp/admin/upload"><h4>UPLOAD</h4></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3" style="max-width: 50%; flex: 0 0 50%">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-social-twitter bg-c-yellow card1-icon"></i>
                                            <span class="text-c-yellow f-w-600">MEMBERS</span>
                                            <a href="/mvp/admin/manage">
                                            <h4>MANAGEMENT</h4>
                                            </a>
                                            <div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->
                                <!-- Statestics Start -->
                                <div class="col-md-12 col-xl-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>List</h5>
                                            <div class="card-header-left ">
                                            </div>
                                            <div class="card-header-right">
                                            </div>
                                        </div>
                                        <div class="card-block">
                                            <div class="card-block tab-icon">
                                                <!-- Row start -->
                                                <div class="row">
                                                    <div class="col-md-12 col-xl-8">
                                                        <ul class="nav nav-tabs md-tabs " role="tablist">
                                                            <li class="nav-item">
                                                                <a class="tab1 nav-link active" data-toggle="tab"
                                                                   href="#music" role="tab"><i class="fas fa-music"></i></a>
                                                                <div class="slide"></div>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="tab2 nav-link" data-toggle="tab" href="#video"
                                                                   role="tab"><i class="fas fa-video"></i></a>
                                                                <div class="slide"></div>
                                                            </li>
                                                        </ul>
                                                        <!-- Tab panes -->
                                                        <form role="form" action="" method="">
                                                            <input type="hidden" id='token'
                                                                   name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="tab-content card-block"
                                                            <%--style="border-right: 1px solid #9e9e9e; width: 50%;"--%>>
                                                                <ul class="admin_audio_list" style="text-align: center">
                                                                    <li>
                                                                        <div class="tab-pane fade show active"
                                                                             id="music"
                                                                             role="tabpanel">
                                                                            <div style="padding-bottom: 1px; border-bottom: 1px solid #ccc; margin-bottom: 10px; font-size: 20px;">
                                                                                <div class="admin_audio_sub"
                                                                                     style="width: 360px; text-align: left;">
                                                                                    TITLE
                                                                                </div>
                                                                                <div class="admin_audio_sub"
                                                                                     style="width: 315px;">
                                                                                    SINGER
                                                                                </div>
                                                                                <div class="admin_audio_sub"
                                                                                     style="width: 86px;">
                                                                                    LIKE
                                                                                </div>
                                                                                <div class="admin_audio_sub"
                                                                                     style="width: 6%;">
                                                                                    COUNT
                                                                                </div>
                                                                                <div class="admin_audio_sub"
                                                                                     style="width: 24%;">
                                                                                    CATEGORY
                                                                                </div>
                                                                            </div>
                                                                            <c:forEach items="${list}" var="media"
                                                                                       varStatus="status">
                                                                                <c:if test="${media.type == 0}">
                                                                                    <div style="padding-bottom: 1px;">
                                                                                        <div class="admin_audio_sub"
                                                                                             style="width: 25%;">
                                                                                                ${media.title}
                                                                                        </div>
                                                                                        <div class="admin_audio_sub"
                                                                                             style="width: 22%;">
                                                                                                ${media.singer}
                                                                                        </div>
                                                                                        <div class="admin_audio_sub"
                                                                                             style="width: 6%;">
                                                                                                ${media.m_like}
                                                                                        </div>
                                                                                        <div class="admin_audio_sub"
                                                                                             style="width: 6%;">
                                                                                                ${media.count}
                                                                                        </div>
                                                                                        <div class="admin_audio_sub"
                                                                                             style="width: 12%;">
                                                                                                ${media.category}
                                                                                        </div>
                                                                                        <div class="admin_audio_sub">
                                                                                            <button type="submit"
                                                                                                    data-no='${media.no}'
                                                                                                    class="btn btn-warning"
                                                                                                    name="modifyBtn">
                                                                                                Modify
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="admin_audio_sub">
                                                                                            <button type="button"
                                                                                                    data-num='${media.no}'
                                                                                                    class="btn btn-danger"
                                                                                                    name="deleteBtn">
                                                                                                Delete
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                                <ul class="admin_media_list"
                                                                    style="text-align: center;">
                                                                    <li>
                                                                        <div class="tab-pane fade" id="video"
                                                                             role="tabpanel">
                                                                            <div style="padding-bottom: 1px; border-bottom: 1px solid #ccc; margin-bottom: 10px; font-size: 20px;">
                                                                                <div class="admin_media_sub"
                                                                                     style="width: 39%;">
                                                                                    TITLE
                                                                                </div>
                                                                                <div class="admin_media_sub"
                                                                                     style="width: 6%;">
                                                                                    LIKE
                                                                                </div>
                                                                                <div class="admin_media_sub"
                                                                                     style="width: 6%;">
                                                                                    COUNT
                                                                                </div>
                                                                                <div class="admin_media_sub"
                                                                                     style="width: 32%;">
                                                                                    CATEGORY
                                                                                </div>
                                                                            </div>
                                                                            <c:forEach items="${list}" var="media">
                                                                                <c:if test="${media.type == 1}">
                                                                                    <div style="padding-bottom: 1px;">
                                                                                        <div class="admin_media_sub"
                                                                                             style="width: 39%;">
                                                                                                ${media.title}
                                                                                        </div>
                                                                                        <div class="admin_media_sub"
                                                                                             style="width: 6%;">
                                                                                                ${media.m_like}
                                                                                        </div>
                                                                                        <div class="admin_media_sub"
                                                                                             style="width: 6%;">
                                                                                                ${media.count}
                                                                                        </div>
                                                                                        <div class="admin_media_sub"
                                                                                             style="width: 20%;">
                                                                                                ${media.category}
                                                                                        </div>
                                                                                        <div class="admin_media_sub">
                                                                                            <button type="submit"
                                                                                                    data-no='${media.no}'
                                                                                                    class="btn btn-warning"
                                                                                                    name="modifyBtn">
                                                                                                Modify
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="admin_media_sub">
                                                                                            <button type="submit"
                                                                                                    data-num='${media.no}'
                                                                                                    class="btn btn-danger"
                                                                                                    name="deleteBtn">
                                                                                                Delete
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        function confirm(value) {
            Swal.fire({
                title: '삭제 하시겠습니까?',
                text: "정말로 삭제 하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '삭제완료!',
                        '해당 콘텐츠가 삭제되었습니다.',
                        'success'
                    ).then(function () {
                        var frm = $('form');
                        frm.attr('action', '/remove?no=' + value);
                        frm.submit();
                    })
                }
            })
        }

        function confirm(value) {
            Swal.fire({
                title: '삭제 하시겠습니까?',
                text: "정말로 삭제 하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '삭제완료!',
                        '해당 콘텐츠가 삭제되었습니다.',
                        'success'
                    ).then(function () {
                        var frm = $('form');
                        frm.attr('method', 'POST');
                        frm.attr('action', '/remove?no=' + value);
                        frm.submit();
                    })
                }
            })
        }

        $('button[name=deleteBtn]').click(function (e) {
            e.preventDefault();
            var value = $(this).attr("data-num");
            confirm(value);
        });

        $('button[name=modifyBtn]').click(function (e) {
            e.preventDefault();
            var value = $(this).attr("data-no");
            $('#token').remove();
            location.href = '/mvp/admin/modify?no=' + value;
        });

        $('.tab1').click(function (e) {
            $('.admin_media_list').hide();
            $('.admin_media_sub').hide();
            $('.admin_audio_list').show();
            $('.admin_audio_sub').show();
        });
        $('.tab2').click(function (e) {
            $('.admin_audio_list').hide();
            $('.admin_audio_sub').hide();
            $('.admin_media_list').show();
            $('.admin_media_sub').show();
        });
    });
</script>