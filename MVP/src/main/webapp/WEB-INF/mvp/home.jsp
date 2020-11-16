<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="header.jsp" %>

<style>
    .newsletter_form {
        margin-top: 0;
    }

    .newsletter_button {
        top: auto;
        font-size: 25px;
    }

    input::placeholder {
        font-weight: bold;
    }

    .home_link {
        margin-top:0;
    }
    .newsletter_container {
        padding-top: 0;
    }

</style>

<!-- Home -->
<form action="/search" id="newsletter_form" class="newsletter_form" method="GET">
    <div style="display: flex;">
        <select name="baseOpt" style="width: 5%;font-size: 20px;">
            <option value="1">&nbsp;&nbsp;전체</option>
            <option value="2">&nbsp;&nbsp;뮤직</option>
            <option value="3">&nbsp;&nbsp;비디오</option>
        </select>
        <input type="search" class="newsletter_input" placeholder="Search.."
               required="required" name="keyword">
        <button type="submit" class="newsletter_button">Search</button>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<div class="home">
    <div class="home_slider_container">

        <!-- Home Slider -->
        <div class="owl-carousel owl-theme home_slider">

            <!-- Slide -->
            <div class="owl-item">
                <div class="background_image" style="background-image:url(/resources/static/img/index.jpg)"></div>
                <div class="home_container">
                    <div class="home_container_inner d-flex flex-column align-items-center justify-content-center">
                        <div class="home_content text-center" style="margin-bottom: 215px;">
                            <div class="home_title">
                                <h1>
                                    <span style="font-size: 130px;">M</span>
                                    <span style="font-size: 130px; color: red;">V</span>
                                    <span style="font-size: 130px;">P</span>
                                </h1>
                            </div>
                            <div class="newsletter_container">
                            </div>
                            <div class="home_link"><a href="#">MUSIC & VIDEO PLAYER</a></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</body>

<%@include file="sidebar.jsp" %>
<%@include file="footer.jsp" %>

<script>
    /*    $('#SelectedMusic').hide();

        $('#BaseOpt').on("change", function (e) {
            $('#SelectedMusic option').remove();

            var selected = $('#BaseOpt').val();
            alert(selected);

            if (selected == "Music") {
                $('#SelectedMusic').show();
                var music = ["Singer", "Title"];
                for (var i = 0; i < music.length; i++) {
                    var opt = $("<option value=" + music[i] + ">" + music[i] + "</option>");
                    $('#SelectedMusic').append(opt);
                }
            } else {
                $('#SelectedMusic').hide();
                return false;
            }
        });*/
</script>