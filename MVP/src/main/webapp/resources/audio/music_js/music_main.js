
function openWin(f,s) {
        adWindow = window.open(f, s, 'width=500,height=620,status=no,left=600,top=300');
}


function cAll() {
    if ($("#checkAll").is(":checked")) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}

var modals = document.getElementsByClassName("modal");
var btns = document.getElementsByClassName("btn");
var spanes = document.getElementsByClassName("modal_close");
var funcs = [];

function Modal(num) {
    return function() {

        btns[num].onclick =  function() {
            modals[num].style.display = "block";
            console.log(num);
        };

        spanes[num].onclick = function() {
            modals[num].style.display = "none";
        };
    };
}

for(var i = 0; i < btns.length; i++) {
    funcs[i] = Modal(i);
}

for(var j = 0; j < btns.length; j++) {
    funcs[j]();
}
window.onclick = function(event) {
        if (event.target.className === "modal") {
            event.target.style.display = "none";
        }
    }

function play() {
    var audio = document.getElementById('audio_play');
    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
        audio.currentTime = 0
        }
}

function addPlayList() {
    var agree = confirm("곡을 재생하시겠습니까?");
    if (agree) {
        var arrayParam = new Array();
        $("input[name=no]:checked").each(function () {
            var test = $(this).val();
            arrayParam.push($(this).val());
            alert("벨류값확인 : " + arrayParam);
        });
        $('#noList').val(arrayParam);
        $("#subForm").submit();
    }else {
        alert("체크박스가 체크되어있지 않습니다.");
    }
}
function addPlayList_2() {
    var agree = confirm("곡을 추가하시겠습니까?");
    if (agree) {
        var arrayParam = new Array();
        $("input[name=no]:checked").each(function () {
            var test = $(this).val();
            arrayParam.push($(this).val());
            alert("벨류값확인 : " + arrayParam);
        });
        $('#noList').val(arrayParam);
        $("#subForm").submit();
    }
}



