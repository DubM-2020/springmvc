<%@ include file="../audio/header.jsp"%>


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


    <div class="discs">
        <div class="container">
            <div id="scroll2">
                <div id="scrollstart" class="row discs_row">
                    <!-- Disc by DB -->
                    <div class="listToChange"></div>
                    <c:forEach items="${list}" var="mlist">
                        <input type="hidden" class="scrolling" data-no="${mlist.no}">
                        <div class="col-xl-4 col-md-6">
                            <div class="disc" >
                                <a href="/audio/music?no=${mlist.no}&singer=${mlist.singer}">
                                    <div class="disc_cover" >
                                        <img class="disc_cover_file" src="/resources/audio/music_mp3img/${mlist.fileName}"
                                        alt="music cover images">
                                        <div class="disc_cover_text">
                                            <div class="disc_title">${mlist.title}</div>
                                            <div class="disc_subtitle">${mlist.singer}</div>
                                        </div>

                                    </div>

                                </a>
                            </div>
                        </div>

                    </c:forEach>
                    <div class="scrollLocation">
                    </div>
                </div>
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
    var token = $("input[name='_csrf']").val();
    var header = "X-CSRF-TOKEN";
    var lastScrollTop = 0;
    var easeEffect = 'easeInQuint';
    var timeout;

    $(document).ready(function () {
        $('#scroll2').scroll(function () { //스크롤 이벤트 발생
            console.log("문서크기:" + $('#scrollstart').height() + "|| 창크기:" + $('#scroll2').height() +
                "||문서-창: " + ($('#scrollstart').height() - $('#scroll2').height()) + "|| 스크롤위치:" + $('#scroll2').scrollTop());
            var currentScrollTop = $('#scroll2').scrollTop();

            //다운 스크롤
            if (currentScrollTop - lastScrollTop > 0) {
                console.log("down-scroll");


                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    if (Math.ceil($('#scroll2').scrollTop()) + 3 >= parseInt($('#scrollstart').height() - $('#scroll2').height())) { //스크롤 동작 계산식

                        var lastbno = $(".scrolling:last").attr("data-no");
                        //마지막 bno값을 읽는다. ajax를 이용하여 서버로부터 다음 게시물을 받아온다.
                        $.ajax({
                            type: 'post',
                            url: '/audio/testscrolldown',
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader(header, token);
                            },
                            headers: {
                                "Content-Type": "application/json",
                                "X-HTTP-Method-Override": "POST"
                            },
                            dataType: 'json',
                            data: JSON.stringify({
                                no: lastbno
                            }),
                            success: function (data) {
                                var str = "";

                                if (data != "") {
                                    $(data).each(
                                        function () {
                                            console.log(this);
                                            str += "<div class=" + "'col-xl-4 col-md-6'" + ">"
                                                /*+ "<div class=" + "'col-xl-4 col-md-6 listToChange'" + ">"*/
                                                + "<div class=" + "'disc'" + ">"
                                                + "<input type=" + "'hidden'" + "class=" + "'scrolling'" + "data-no=" + this.no + ">"
                                                + "<a href=" + "'/audio/music?no=" + this.no + "&singer=" + this.singer + "'" + ">"
                                                + "<div class=" + "'disc_cover'" + ">"
                                                + "<img class=" + "'disc_cover_file'"+" src=" + "'/resources/audio/music_mp3img/" + this.fileName + "'"
                                               /* + " alt=" + "'music cover images'" + " width=" + "'300px'" + " height=" + "'300px'" + ">"*/
                                                + " alt=" + "'music cover images'" + ">"
                                                + "<div class=" + "'disc_cover_text'" + ">"
                                                + "<div class=" + "'disc_title'" + ">" + this.title + "</div>"
                                                + "<div class=" + "'disc_subtitle'" + ">" + this.singer + "</div>"
                                                + "</div>"
                                                + "</div>"
                                                + "</a>"
                                                + "</div>"
                                                + "</div>"

                                        }); //each
                                    $(".scrollLocation").before(str);

                                } //if
                                else {
                                    console.log("noDATE");
                                } //else

                            } //sucess
                        }); //ajax
                        var position = $(".listToChange:first").offset();
                        $('html,body').stop().animate({scrollTop: position.top + 10}, 600, easeEffect);
                    } //if: 현재 스크롤의 top 좌표가 > (게시글 화면 height-윈도창의 height)가 될때
                }, 500);

                lastScrollTop = currentScrollTop;
            } // 다운스크롤
        });
    });

</script>
<script type="text/javascript">
    $(function () {

        $("#go_top").hide();
        $('#scroll2').scroll(function () {
            if ($('#scroll2').scrollTop() > 180) {
                $("#go_top").fadeIn();
            } else {
                $("#go_top").fadeOut();
            }
        });
    });
    $('#go_top').on("click", function (e) {
        console.log("위로버튼 클릭");
        e.preventDefault();
        $("#scroll2").scrollTop(0);

    });
</script>


<%@ include file="../mvp/sidebar.jsp" %>
<%--<%@include file="../mvp/footer.jsp"%>--%>

