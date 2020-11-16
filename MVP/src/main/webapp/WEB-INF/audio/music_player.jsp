<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
          integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
          crossorigin="anonymous"/>
    <link href="/resources/audio/music_css/music_player.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="mhn-player">
    <div class="album-art"></div>
    <div class="play-list">
        <c:forEach items="${p_list}" var="list" varStatus="status">
            <a href="#" class="play cnt${status.count}" id="muse"
               data-id="${status.count}"
               data-album="${list.category}"
               data-artist="${list.singer}"
               data-title="${list.title}"
               data-albumart="/resources/audio/music_mp3img/${list.fileName}"
               data-url="/resources/audio/music_mp3/${list.pmp3}">
            </a>
            <i class="far fa-window-close" type="button" name="delete_Btn" data-status="${list.h_no}" data-cnt="${status.count}"
               style="font-size: 25px; float: right; margin-top: 10px; margin-right: 20px; cursor: pointer;"></i>
        </c:forEach>
    </div>

    <div class="audio"></div>
    <div class="current-info">
        <div class="song-artist"></div>
        <div class="song-album"></div>
        <div class="song-title"></div>
    </div>
    <div class="controls">
        <a href="#" class="toggle-play-list"><i class="fa fa-list-ul"></i></a>
        <div class="duration clearfix">
            <span class="pull-left play-position"></span>
            <span class="pull-right"><span class="play-current-time">0</span> / <span
                    class="play-total-time">00:00</span></span>
        </div>
        <div class="progress">
            <div class="bar"></div>
        </div>
        <div class="action-button">
            <a href="#" class="prev"><i class="fa fa-step-backward"></i></a>
            <a href="#" class="play-pause"><i class="fa fa-pp"></i></a>
            <a href="#" class="stop"><i class="fa fa-stop"></i></a>
            <a href="#" class="next"><i class="fa fa-step-forward"></i></a>
            <input type="range" class="volume" min="0" max="1" step="0.1" value="0.5" data-css="0.5">
        </div>

    </div>
</div>
</body>
</html>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="/resources/audio/music_js/music_player.js"></script>

<script>
    if (self.name != 'reload') {
        self.name = 'reload';
        self.location.reload(true);
    } else self.name = '';
</script>

<script>

    $(function(){

        function remove(h_no, callback, error) {
            $.ajax({
                type: 'delete',
                url: '/audio/music_player/' + h_no,
                success: function (deleteResult, status, xhr) {
                    if (callback) {
                        callback(deleteResult);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        $('i[name=delete_Btn]').on("click", function (e) {
            var hno = $(this).attr('data-status');
            var cnt = $(this).attr('data-cnt');

            remove(hno);

            $('.cnt' + cnt).remove();
            $(this).remove();
        })
    });


</script>