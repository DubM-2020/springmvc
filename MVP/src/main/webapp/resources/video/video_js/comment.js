console.log("Reply Module....");
var commentService = (function(){

    function add(comment, callback, error){
        console.log("add reply.....");

        $.ajax({
            type : 'post',
            url : '/comment/new',
            data : JSON.stringify(comment),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback){
                    callback(result);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        })
    }
    function getList(param, callback, error){
        var no = param.no;
        var page = param.page || 1;

        $.getJSON("/comment/pages/" + no + "/" + page + ".json",
            function(data){
                if(callback){
                    //callback(data); //댓글 목록만 가져오는 경우
                    callback(data.commentCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
                }
            }).fail(function(xhr, status, err){
            if (error){
                error();
            }
        });
    }
    function remove(c_no, writer, callback, error){
        $.ajax({
            type : 'delete',
            url : '/comment/' + c_no,
            data: JSON.stringify({c_no:c_no, writer:writer}),
            contentType: "application/json; charset=utf-8",
            success : function(deleteResult, status, xhr){
                if(callback){
                    callback(deleteResult);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        });
    }

    function update(comment, callback, error){
        console.log("c_no:"+comment.c_no);

        $.ajax({
            type : 'put',
            url : '/comment/'+comment.c_no,
            data : JSON.stringify(comment),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        });
    }
    function get(c_no, callback, error){
        $.get("/comment/" + c_no + ".json", function(result){
            if(callback){
                callback(result);
            }
        }).error(function(xhr, status, err){
            if(error){
                error();
            }
        });
    }
    function displayTime(timeValue){
        var today = new Date();

        var gap = today.getTime() - timeValue;

        var dateObj = new Date(timeValue);
        var str="";

        if (gap < (1000 * 60 * 60 * 24)) {
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0')+mi,
                ':', (ss > 9 ? '' : '0') + ss ].join('');
        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
            var dd = dateObj.getDate();

            return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                (dd > 9 ? '' : '0') + dd ].join('');
        }
    }

    return {
        add : add,
        getList : getList,
        remove : remove,
        update : update,
        get : get,
        displayTime : displayTime
    };
})();