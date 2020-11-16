<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="user"/>
<%@include file="video_header.jsp" %>
<%@page pageEncoding="UTF-8" %>

<style>
    button,
    button:focus {
        border: none;
        cursor: pointer;
        outline: none;
    }

    .metadata .titleAndButton .title {
        font-size: 22px;
    }

    .metadata .titleAndButton .title.clamp {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100%;
        max-height: 100%;
    }

    .metadata .titleAndButton .moreBtn {
        margin-right: 5px;
        margin-top: 7px;
        font-size: 18px;
        float: left;
        transition: transform 300ms ease-in-out;
    }

    .metadata .titleAndButton .moreBtn.clicked {
        transform: rotate(180deg);
    }

    .left.clearfix:hover {
        opacity: 0.5;
        color: #96afab;
        cursor: grab;
    }

    .latest_news_content:hover {
        opacity: 0.5;
        color: #e2dddd;
        cursor: grab;
    }

    .sidebar_text a:hover {
        color: #7b8b9c;
        cursor: grab;
    }
</style>


<!-- modal button start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" style="color: black;">COMMENT</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label style="color: #1b1b1b">CONTENT</label>
                    <input class="form-control" name='reply' value='New Reply!!!'>
                </div>
                <div class="form-group" style="color: #1b1b1b">
                    <label>WRITER</label>
                    <input class="form-control" name='writer' value='writer' readonly>
                </div>
                <div class="form-group">
                    <label>COMMENT DATE</label>
                    <input class="form-control" name='c_date' value=''>
                </div>
            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button"><i class="fas fa-eraser"
                                                          style="font-size: 25px; margin-right: 1.25rem;"></i></button>
                <button id='modalRemoveBtn' type="button"><i class="fas fa-trash-alt"
                                                             style="font-size: 25px;margin-right: 1.25rem;"></i>
                </button>
                <button id='modalRegisterBtn' type="button"><i class="fas fa-pen-square"
                                                               style="font-size: 25px; margin-right: 1.25rem;"></i>
                </button>
                <button id='modalCloseBtn' type="button" data-dismiss="modal"><i class="far fa-window-close"
                                                                                 style="font-size: 25px;"></i></button>
            </div>
        </div>
    </div>
</div>
<!-- modal button end -->

<script type="text/javascript" src="/resources/video/video_js/comment.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var noValue = '<c:out value="${list.no}"/>';
        var replyUL = $(".chat");

        showList(1);

        function showList(page) {
            commentService.getList({no: noValue, page: page || 1}, function (commentCnt, list) {

                console.log("commentCnt: " + commentCnt);
                console.log("list: " + list);
                console.log(list);

                if (page === -1) {
                    pageNum = Math.ceil(commentCnt / 10.0);
                    showList(pageNum);
                    return;
                }

                var str = "";

                if (list == null || list.length === 0) {
                    replyUL.html("");
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='left clearfix' title='클릭 시 댓글(수정,삭제)'  data-c_no='" + list[i].c_no + "'>";
                    str += "  <div style='margin-top: 10px;\n" +
                        "    font-size: 16px;\n" +
                        "    width: 100%;\n" +
                        /*"    cursor: grab;\n" +*/
                        "    border-top: solid 0.5px #585555; padding: 7px;'><div class='header-writer'><strong class='primary-font' style='color:#6396f3;font-size: 17px; '>"
                        + list[i].writer + "</strong>";
                    str += "    <small class='pull-right text-muted' style='float:none'>"
                        + commentService.displayTime(list[i].c_date) + "</small></div>";
                    str += "    <p style='font-size: 18px;'>" + list[i].reply + "</p></div></li>";
                }
                replyUL.html(str);
                showCommentPage(commentCnt);
            });//end function
        }//end showList

        var pageNum = 1;
        var commentPageFooter = $(".panel-footer");

        function showCommentPage(commentCnt) {
            var endNum = Math.ceil(pageNum / 10.0) * 10;
            var startNum = endNum - 9;

            var prev = startNum !== 1;
            var next = false;

            if (endNum * 10 >= commentCnt) {
                endNum = Math.ceil(commentCnt / 10.0);
            }
            if (endNum * 10 < commentCnt) {
                next = true;
            }
            var str = "<ul class='pagination pull-right'>";

            if (prev) {
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>이전</a></li>";
            }
            for (var i = startNum; i <= endNum; i++) {
                var active = pageNum === i ? "active" : "";
                str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }
            if (next) {
                str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>다음</a></li>";
            }
            str += "</ul></div>";
            console.log(str);

            commentPageFooter.html(str);
        }

        //페이지 번호를 클릭했을 때 새로운 댓글을 가져옴
        commentPageFooter.on("click", "li a", function (e) {
            e.preventDefault();
            console.log("page click");

            var targetPageNum = $(this).attr("href");

            console.log("targetPageNum: " + targetPageNum);
            pageNum = targetPageNum;
            showList(pageNum);
        });

        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputWriter = modal.find("input[name='writer']");
        var modalInputReplyDate = modal.find("input[name='c_date']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");

        var writer = null;

        $("#modalCloseBtn").on("click", function (e) {
            modal.modal('hide');
        });

        <sec:authorize access="isAuthenticated()">
        writer = '${user.username}';
        </sec:authorize>

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $("#addCommentBtn").on("click", function (e) {
            modal.find("input").val("");
            modal.find("input[name='writer']").val(writer);
            modalInputReplyDate.closest("div").hide();
            modal.find("button[id !='modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");

        });

        modalRegisterBtn.on("click", function (e) {

            var reply = {
                reply: modalInputReply.val(),
                writer: modalInputWriter.val(),
                no: noValue
            };
            commentService.add(reply, function (result) {

                Swal.fire(
                    '댓글작성완료',
                    result,
                    'success',
                )

                modal.find("input").val("");
                modal.modal("hide");

                showList(-1);
            });
        });
        $(".chat").on("click", "li", function (e) {
            var c_no = $(this).data("c_no");

            commentService.get(c_no, function (reply) {

                modalInputReply.val(reply.reply);
                modalInputWriter.val(reply.writer);
                modalInputReplyDate.val(commentService.displayTime(reply.c_date))
                    .attr("readonly", "readonly");
                modal.data("c_no", reply.c_no);

                modal.find("button[id!='modalCloseBtn']").hide();
                modalModBtn.show();
                modalRemoveBtn.show();

                $(".modal").modal("show");
            });
        });
        modalModBtn.on("click", function (e) {
            var originalWriter = modalInputWriter.val();

            var reply = {
                c_no: modal.data("c_no"),
                reply: modalInputReply.val(),
                writer: originalWriter
            };
            if (!writer) {
                Swal.fire({
                    icon: 'error',
                    title: '권한이 없습니다',
                    text: '로그인을 진행해주세요',
                    footer: '<a href="/mvp/sign">로그인을 하시겠습니까?</a>'
                })
                modal.modal("hide");
                return;
            }
            console.log("Original Writer:" + originalWriter);

            if (writer != originalWriter) {
                Swal.fire(
                    'ERROR',
                    '자신이 작성한 댓글만 삭제 할 수 있습니다.',
                    'error',
                )
                modal.modal("hide");
                return;
            }
            commentService.update(reply, function (result) {
                Swal.fire(
                    '댓글수정완료',
                    result,
                    'success',
                )
                modal.modal("hide");
                showList(pageNum);
            });
        });
        modalRemoveBtn.on("click", function (e) {
            var c_no = modal.data("c_no");
            console.log("C_NO:" + c_no);
            console.log("WRITER:" + writer);

            if (!writer) {
                Swal.fire({
                    icon: 'error',
                    title: '권한이 없습니다',
                    text: '로그인을 진행해주세요',
                    footer: '<a href="/mvp/sign">로그인을 하시겠습니까?</a>'
                })
                modal.modal("hide");
                return;
            }
            var originalWriter = modalInputWriter.val();

            console.log("Original Writer:" + originalWriter); //댓글 원래 작성자
            if (writer != originalWriter) {
                Swal.fire(
                    'ERROR',
                    '자신이 작성한 댓글만 삭제 할 수 있습니다.',
                    'error',
                )
                modal.modal("hide");
                return;
            }

            Swal.fire({
                title: '댓글 삭제',
                text: "정말 해당 댓글을 삭제 하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.isConfirmed) {
                    commentService.remove(c_no, originalWriter, function (result) {
                        modal.modal("hide");
                        showList(pageNum);
                    });
                }
            })
        });
    });
</script>

<script>
    $(document).ready(function () {
        var Form = $("#Form");

        $("button[data-oper='modify_comment']").on("click", function (e) {
            Form.attr("action", "/watch/modify_comment").submit();
        });
        $("button[data-oper='comment_list']").on("click", function (e) {
            Form.find("#no").remove();
            Form.attr("action", "/watch/comment_list")
            Form.submit();
        });
    });
</script>
<script>
    function like_func() {

        var frm_read = $('#frm_read');
        console.log("frm_read:", frm_read);
        var media_no = $('#media_no', frm_read).val();
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        media_no = ${list.no};
        console.log("media_no:", media_no);
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
                if (msg == '좋아요!') {
                    Swal.fire(
                        '좋아요',
                        msg,
                        'success',
                    )
                } else {
                    Swal.fire(
                        '좋아요 취소',
                        msg,
                        'warning',
                    )
                }
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
</script>

<script type="text/javascript">
    $(function () {
        $("#go_top").hide();
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $("#go_top").fadeIn();
            } else {
                $("#go_top").fadeOut();
            }
        });
    });
</script>

<div class="home" style="height: 30px;">
    <div class="home_inner">
        <div class="home_container">
            <div class="home_content text-center">
            </div>
        </div>
    </div>
</div>

<!-- Video -->
<div class="blog">
    <div class="container">
        <div class="row">
            <!-- Video Posts -->
            <div class="col-lg-9" style="background-color: #111111;">
                <div class="blog_posts">
                    <!-- Video Post -->
                    <div class="blog_post blog_post_audio">
                        <div class="blog_post_date d-flex flex-column align-items-center justify-content-center">
                            <div style="width: 847px; height: 476px;">
                                <video autoplay="autoplay" controls="controls" muted="muted" width="100%;">
                                    <source src="/resources/video/video_mp4/${file.fileName}" type="video/mp4">
                                </video>
                            </div>
                        </div>

                    </div>
                    <!-- Video Post -->
                    <div class="metadata" style="margin-top: 10px; height: 100%;">
                        <!--title-->
                        <div class="titleAndButton" style="font-size: 25px; margin-top: 15px;margin-bottom: 15px;">
                            <button class="moreBtn clicked" style="font-size: 13px;">
                                <i class="fas fa-caret-down"></i>
                            </button>
                            <span class="title clamp"> <c:out value="${list.title}"/> </span>
                        </div>
                        <script>
                            const moreBtn = document.querySelector('.metadata .moreBtn');
                            const title = document.querySelector('.metadata .title');

                            moreBtn.addEventListener('click', () => {
                                moreBtn.classList.toggle('clicked');
                                title.classList.toggle('clamp');
                            });
                        </script>
                        <!-- 좋아요 -->
                        <form method="post">
                            <ul class="actions" style="float: right; display: inline-flex;">

                                <sec:authorize access="isAuthenticated()">
                                    <a href='javascript: like_func();'>
                                        <c:choose>
                                            <c:when test="${like==null || like==0}">
                                                <i class="far fa-heart fa-2x" id="like_img"
                                                   style="color: white"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-heart fa-2x" id="like_img" style="color: red"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </sec:authorize>

                                <sec:authorize access="isAnonymous()">
                                    <a href='javascript: login_need();'><img
                                            src='/resources/audio/music_img/heartwhite.png'
                                            style="width: 25px;"></a>
                                </sec:authorize>
                                <br><span id='like_cnt' style='margin-left: 5px;margin-right: 5px;'>
                                    <c:out value="${list.m_like}"/>
                                </span> <span style="color: #686262;">Likes</span>

                            </ul>
                        </form>
                        <%--조회수--%>
                        <span class="views" style="font-size: 16px; color:#8a9096;"><c:out
                                value="${list.count}"/> views</span>
                        <div style="border-top: solid 25px #2a2a2e;border-bottom: solid 0.5px #525252;margin: 20px 0 20px 0; ">
                            <br>
                        </div>
                        <!-- 댓글 -->
                        <section class="reply">
                            <!-- reply -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel-heading" style="font-size: 20px;">
                                        <i class="fa fa-comments fa-fw"></i>댓글
                                        <sec:authorize access="isAuthenticated()">
                                            <button id="addCommentBtn" class="btn btn-primary btn-xs pull-right"
                                                    style="float: right;font-size: 14px;">ADD REPLY
                                            </button>
                                        </sec:authorize>
                                        <sec:authorize access="isAnonymous()">
                                            <a href="/mvp/sign" style="font-size: 13px; color: #0d6efd; float: right">로그인</a>
                                            <span style="font-size: 13px; float: right;">댓글을 남기시려면 로그인을 하셔야합니다.</span>
                                        </sec:authorize>
                                    </div>
                                    <div class="panel-body" style="margin-top: 15px;">
                                        <ul class="chat">

                                        </ul>
                                    </div>
                                    <!-- /.panel .chat-panel 추가 -->
                                    <div class="panel-footer">
                                    </div>
                                </div>
                            </div>
                            <!-- reply list end -->
                            <form id='Form' action="/watch/modify_comment" method="get">
                                <input type='hidden' id='no' name='no' value='<c:out value="${list.no}"/>'>
                                <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                                <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
                                <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
                                <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
                            </form>
                        </section>
                    </div> <!--end metadata-->
                </div>
            </div>
            <!-- Sidebar VIDEO-->
            <div class="col-lg-3" style="background-color: #111111;">
                <div class="sidebar">
                    <div class="sidebar_section">
                        <div class="sidebar_title" style="margin-top: 10px;margin-bottom: 10px;">
                            <div style="font-size: 16px;">관련 동영상</div>
                            <c:forEach items="${relation}" var="temp">
                                <div class="latest_news_list">
                                    <!--forEach Relation player-->
                                    <!-- Relation PLAYER -->
                                    <div class="latest_news d-flex flex-row align-items-start justify-content-start">
                                        <a href='/video/watch?no=${temp.no}&category=${temp.category}'
                                           style="display: flex; font-size: 13px;line-height: 1.5;color: #d1ecf1;margin-top: 20px; width: 600px;">
                                            <div class="latest_news_image"><img
                                                    src="/resources/video/video_imgs/${temp.fileName}"
                                                    style="width: 150px; height: 90px; margin-right: 10px;">
                                            </div>
                                            <div class="latest_news_content">
                                                <div class="latest_news_title" style="  display: -webkit-box;
                                                        -webkit-box-orient: vertical;
                                                        -webkit-line-clamp: 3;
                                                        overflow: hidden;
                                                        text-overflow: ellipsis;
                                                        max-height: 54px;"><c:out value="${temp.title}"/>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="sidebar_text" style="margin-top: 20px;">
                                <span style="text-align: right; font-size: 15px;">.....동영상 목록으로<a
                                        href="/video/video_list"><i class="far fa-hand-point-right"
                                                                    style="color: #7383de; margin-left: 5px;"></i></a></span>
                            </div>
                            <%-- go top button--%>
                            <a href="#" id="go_top"
                               style="position: fixed; bottom: 40px; right: 40px; z-index: 99999999;" title="Top">
                                <img src="https://tistory1.daumcdn.net/tistory/3542020/skin/images/top.png"
                                     border="0"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function login_need() {
                var flag = confirm("좋아요는 로그인이 필요합니다 로그인을 하시겠습니까?");

                if (flag) {
                    //yes
                    location.replace("/mvp/sign");
                } else {
                    //no
                }
            }
        </script>

<%@include file="../mvp/sidebar.jsp" %>