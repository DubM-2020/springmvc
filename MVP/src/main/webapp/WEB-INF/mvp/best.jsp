<%@ include file="../audio/music_header.jsp" %>
<style>
    .super_container{
        height: 100vh;
    }
    .bestList_section {
        margin-top: 40px;
        height: 90vh;
        margin-left: 334px;
        width: 1000px;
        overflow-y: auto;
        overflow-x: hidden;
    }
    #chart_title{
        text-align: center;
        /*color : #de4f32;*/
        color : white;
        margin-top: 150px;
        font-size: 80px;
        text-shadow: 2px 2px 2px grey;
    }

    .disc_content_1 {
        color: #ffffff;
        cursor: pointer;
        font-size: 14px;
        align-self: center;
        transition: color 0.2s ease-in-out;
    }

    .disc_content_1 .disc_title {
        font-size: 1.5em;
    }

    .button-div {
        margin-left: 786px;
        margin-right: 0px;
    }

    .sortBtn {
        transition-duration: 0.4s;
        border-radius: 9px;
    }

    .sortBtn:hover {
        background-color: red;
        color: white;
    }

    .table_best_list {
        width: 100%;
        font-size: 1.2rem;
    }

    .table_best_head {
        text-align: center;
    }
    .table_best_list th {
        height: 50px;
    }
    .col-md-6 {
        margin-bottom: 42px;
    }
    .table_best_image_file {
        width: 50px;
        height: 50px;
    }
    .best_table_videoImage{
        text-align: center;
    }
    .table_best_videoImage_file {
        width: 150px;
        height: 150px;
    }
    .best_table_rank {
        text-align: center;
    }
    .best_table_title {
        padding-left: 10px;
    }

    .best_table_singer {
        padding-left: 10px;
    }

    .best_table_image {
        text-align: center;
        align-items: center;
    }

    .best_table_count {
        text-align: right;
        padding-right: 15px;
    }

    .best_table_like {
        text-align: right;
        padding-right: 10px;
    }

    .best_table_category {
        text-align: center;
    }
</style>

<H1 id="chart_title">MVP CHART</H1>
<div class="super_container">



    <!-- Discs -->
    <c:forEach items="${list}" var="flist">
        <input type="hidden" name="test" value='<c:out value="${flist.singer}"/>'>
    </c:forEach>
    <div class="bestList_section">

        <table class="table_best_list">
            <tbody>
            <tr class="table_best_head">
                <th>Rank</th>
                <th>Image</th>
                <th class="add_point">Title</th>
                <%--singer 추가 자리--%>
                <th>Count</th>
                <th>Like</th>
                <th>Category</th>
            </tr>

            <div class="button-div">
                <button type="submit" class="sortBtn" id="sortBtn" onclick="btnChange();"></button>
            </div>
            <c:forEach items="${list}" var="blist" varStatus="status">
                <c:choose>
                    <c:when test="${empty blist.singer}">
                        <tr class="table_best_videoo_centents">
                            <td class="best_table_rank">${status.count}</td>
                            <td class="best_table_videoImage"><img class="table_best_videoImage_file"
                                                                   src="/resources/video/video_imgs/${blist.fileName}"
                                                                   alt="best table images"></td>
                            <td class="best_table_title">${blist.title}</td>

                            <td class="best_table_count">${blist.count}</td>
                            <td class="best_table_like">${blist.m_like}</td>
                            <td class="best_table_category">${blist.category}</td>
                        </tr>

                    </c:when>
                    <c:when test="${not empty blist.singer}">
                        <tr class="table_best_centents">
                            <td class="best_table_rank">${status.count}</td>
                            <td class="best_table_image" onclick="">
                                <a href="/audio/music?no=${blist.no}&singer=${blist.singer}">
                                    <img class="table_best_image_file"
                                                              src="/resources/audio/music_mp3img/${blist.fileName}"
                                         alt="best table images"></a></td>
                            <td class="best_table_title">
                                <a href="/audio/music?no=${blist.no}&singer=${blist.singer}">${blist.title}</a></td>
                            <td class="best_table_singer">${blist.singer}</td>
                            <td class="best_table_count">${blist.count}</td>
                            <td class="best_table_like">${blist.m_like}</td>
                            <td class="best_table_category">${blist.category}</td>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>

            </tbody>
        </table>
    </div>


</div>

<script>
   $(document).ready(function () {
        $(".sortBtn").text('Like');
        $("#chart_title").text('MVP CHART');
        var temp = getParameterByName('sort');
        console.log("temp:"+temp);

        if(temp == '1') {
            $(".sortBtn").text('Like');
            $("#chart_title").text('MVP MUSIC CHART');
        } else if(temp == '2'){
            $(".sortBtn").text('Count');
            $("#chart_title").text('MVP MUSIC CHART');
        } else if(temp == '3'){
            $(".sortBtn").text('Like');
            $("#chart_title").text('MVP VIDEO CHART');}
        else {
            $(".sortBtn").text('Count');
            $("#chart_title").text('MVP VIDEO CHART');
        }

        var test = document.getElementsByName("test")[0].value;
        console.log(test);
        if (test) {
            addTH();
        }
    });
    function addTH() {
        var str = "";
        str += "<th>Singer</th>";
        $(".add_point").after(str);
    }
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    function btnChange() {
        var patId = getParameterByName('sort');

        var url = "";
        url = urlRole(patId);

        console.log(patId);
        console.log(location.search);

        location.href = '/mvp/best?' + url;
    };

    function urlRole(patId){
        var url = "";
        if (patId == 1) {
            url = "sort=2";
        } else if (patId == 2) {
            url = "sort=1";
        } else if (patId == 3) {
            url = "sort=4";
        } else if (patId == 4) {
            url = "sort=3";
        }
        console.log("urlRole:" + url);
        return url;
    }

</script>

<%@include file="../mvp/sidebar.jsp" %>
<%--<%@include file="../mvp/footer.jsp" %>--%>
