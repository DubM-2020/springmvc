<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="header.jsp" %>
<head>
    <title>GURU Able - Free Lite Admin Template </title>
</head>
<style>
    #dropZone {
        border: 2px dotted #3292A2;
        color: #92AAB0;
        text-align: center;
        font-size: 24px;
        padding: 12px 0;
        margin: 10px 0;
    }

    .uploadResult {
        width: 100%;
        background-color: gray;
    }

    .uploadResult ul {
        display: flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }

    .uploadResult ul li {
        list-style: none;
        padding: 10px;
    }

    .uploadResult ul li img {
        width: 100px;
    }
</style>
<script>

    $(document).ready(function () {

        $('#type').on("change", function (e) {
            var music = ["Ballade", "Dance", "Hip-Hop", "Band"];
            var video = ["Entertainment", "Sport", "Dance", "MV"];

            var selected = $('#type').val();
            var opt;

            if (selected == "0") {
                opt = music;
                $(".singer").show();
                $(".Area").show();
            } else if (selected == "1") {
                opt = video;
                $(".singer").hide();
                $(".Area").hide();
            }
            $('#category option').remove();

            for (var i = 0; i < opt.length; i++) {
                var option = $("<option value=" + opt[i] + ">" + opt[i] + "</option>");
                $('#category').append(option);
            }
        });


        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click", function (e) {

            e.preventDefault();

            console.log("submit clicked");

            var str = "";

            $(".uploadResult ul li").each(function (i, obj) {

                var jobj = $(obj);

                console.dir(jobj);
                console.log("-------------------------");
                console.log(jobj.data("filename"));

                str += "<input type='hidden' name='fileList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='fileList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='fileList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='fileList[" + i + "].image' value='" + jobj.data("type") + "'>";

            });

            formObj.append(str).submit();
        });

        var regex = new RegExp("(.*?)\.(avi|mp3|mp4|wav)$");
        var imgreg = new RegExp("(.*?)\.(jpg|jpeg|png|bmp)$");

        var maxSize = 10485760;

        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";

        var uploadResult = $(".uploadResult ul");

        function checkExtension(fileName, fileSize) {
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            if (!regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;
        }

        function checkImg(img) {
            if (!imgreg.test(img)) {
                alert("이미지 파일만 업로드 가능합니다.");
                return false;
            }
            return true;
        }

        function showUploadedFile(uploadResultArr) {

            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                console.log('obj : ' + obj.fileName);
                var temp = obj.fileName.slice(obj.fileName.indexOf(".") + 1).toLowerCase();
                console.log('temp : ' + temp);

                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                if (temp == "mp3" || temp == "wav") {

                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
                    str + " ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' "
                    str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<i class='fas fa-file-music fa-2x'></i></i>";
                    str += "</div>";
                    str + "</li>";

                } else if (temp == "avi" || temp == "mp4") {

                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
                    str + " ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' "
                    str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<i class='fas fa-file-video fa-2x'></i>";
                    str += "</div>";
                    str + "</li>";

                } else if (temp == "jpg" || temp == "png" || temp == "bmp" || temp == "jpeg") {

                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
                    str + " ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' "
                    str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<i class=\"fas fa-file fa-2x\"></i>";
                    str += "</div>";
                    str + "</li>";

                } else {

                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
                    str + " ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' "
                    str += "data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<i class=\"fas fa-file fa-2x\"></i>";
                    str += "</div>";
                    str + "</li>";

                    /*                    str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" +
                                            "<li><i class=\"fas fa-file fa-2x\"></i>" + obj.fileName + "</a>" +
                                            "<span data-file=\'" + fileCallPath + "\' data-type='file'> x </span>" +
                                            "<div></li>"*/
                }
            });

            uploadResult.append(str);
        }

        $(".uploadResult").on("click", "button", function (e) {

            var targetFile = $(this).data("file");
            var type = $(this).data("type");
            console.log(targetFile);

            var targetLi = $(this).closest("li");

            $.ajax({
                url: '/deleteFile',
                data: {fileName: targetFile, type: type},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'text',
                type: 'POST',
                success: function (result) {
                    alert(result);
                    targetLi.remove();
                }
            }); //$.ajax
        });

        $("#upFile").on("change", function (e) {
            var formData = new FormData();
            var inputFile = $("input[id='upFile']");
            var files = inputFile[0].files;

            console.log(files);

            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }
            uploadFile(formData);
        });

        $(".imgUpload").on("change", function (e) {
            var formData = new FormData();
            var imgFile = $(".imgUpload");
            var files = imgFile[0].files;

            for (var i = 0; i < files.length; i++) {
                if (!checkImg(files[i].name)) {
                    return false;
                }
                var reader = new FileReader();
                reader.onload = function (data) {
                    $(".imgArea img").attr("src", data.target.result).width(500);
                }
                reader.readAsDataURL(this.files[0]);
                formData.append("uploadFile", files[i]);
            }
            uploadFile(formData);
        });

        var dropZone = $("#dropZone");

        dropZone.on('dragenter dragover', function (e) {
            e.stopPropagation();
            e.preventDefault();
            dropZone.css('background-color', '#E3F2FC');
        });
        dropZone.on('dragleave', function (e) {
            e.stopPropagation();
            e.preventDefault();
            dropZone.css('background-color', '#FFFFFF');
        });
        dropZone.on('drop', function (e) {
            e.preventDefault();
            dropZone.css('background-color', '#FFFFFF');

            var files = e.originalEvent.dataTransfer.files;
            var formData = new FormData();
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                formData.append("uploadFile", file);
            }
            if (files != null) {
                if (files.length < 1) {
                    alert("폴더 업로드 불가");
                    return;
                }
                uploadFile(formData);

            } else {
                alert("ERROR");
            }
        });

        var $progressBar = $("#progressBar");

        function setProgress(per) {
            $progressBar.val(per);
        }

        function uploadFile(formData) {
            $.ajax({
                url: '/upload',
                processData: false,
                contentType: false,
                data: formData,
                dataType: 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    xhr.upload.onprogress = function (e) {
                        var percent = e.loaded * 100 / e.total;
                        setProgress(percent);
                    };
                    return xhr;
                },
                type: 'POST',
                success: function (result) {
                    console.log(result);
                    showUploadedFile(result);
                }
            });
        }
    });
</script>

<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <nav class="pcoded-navbar">
            <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
            <div class="pcoded-inner-navbar main-menu">
            </div>
        </nav>
        <div class="pcoded-content">
            <div class="pcoded-inner-content">

                <!-- Main-body start -->
                <div class="main-body">
                    <div class="page-wrapper">
                        <!-- Page-header start -->
                        <div class="page-header card">
                            <div class="row align-items-end">
                                <div class="col-lg-8">
                                    <div class="page-header-title">
                                        <i class="icofont icofont-file-code bg-c-blue"></i>
                                        <div class="d-inline">
                                            <h4>UPLOAD</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Page-header end -->

                        <!-- Page body start -->
                        <div class="page-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form role="form" action="/uploadAction" method="POST" accept-charset="UTF-8">
                                        <div class="card">
                                            <div class="form-group row" style="padding-top: 25px;">
                                                <label class="col-sm-2 col-form-label"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Title</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="제목"
                                                           name="title">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Type</label>
                                                <div class="col-sm-10">
                                                    <div style="padding-bottom: 5px;">
                                                    <select name="type" id="type" class="form-control">
                                                        <option value="0" selected>Music</option>
                                                        <option value="1">Video</option>
                                                    </select>
                                                    </div>
                                                    <div>
                                                    <select name="category" id="category" class="type_a form-control">
                                                        <option value="Ballade">Ballade</option>
                                                        <option value="Dance">Dance</option>
                                                        <option value="Hip-Hop">Hip-Hop</option>
                                                        <option value="Band">Band</option>
                                                    </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Image</label>
                                                <div class="col-sm-10">
                                                    <input type="file" class="imgUpload form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label singer"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Singer</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control singer" placeholder="가수"
                                                           name="singer">
                                                </div>
                                            </div>
                                            <div class="imgArea">
                                                <img src="">
                                            </div>
                                            <div class="form-group row Area">
                                                <label class="col-sm-2 col-form-label"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Textarea</label>
                                                <div class="col-sm-10">
                                                    <div class="form-group">
                                                    </div>
                                                    <label style="display: block;">
                                                        <textarea rows="5" cols="5" class="form-control"
                                                                  name="content"></textarea>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label"
                                                       style="padding-left: 30px; font-weight: 600; font-size: 16px;">
                                                    Upload File</label>
                                                <div class="col-sm-10 uploadDiv">
                                                    <input type="file" class="form-control" name='uploadFile'
                                                           id='upFile' multiple>
                                                </div>
                                            </div>
                                            <div id="dropZone">Drag & Drop Files Here</div>

                                            <progress id="progressBar" value="0" max="100"
                                                      style="width:100%; height:35px;"></progress>

                                            <div class="card">
                                                <div class="card-block">
                                                    <h4 class="sub-title">FILE LIST</h4>
                                                    <div class="uploadResult">
                                                        <ul>

                                                        </ul>
                                                    </div>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <button type="submit" class="btn btn-primary btn-square"
                                                            id='uploadBtn' style="display: block; margin:0 auto">Upload
                                                    </button>
                                                </div>
                                            </div>
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
