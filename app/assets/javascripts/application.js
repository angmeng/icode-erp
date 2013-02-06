// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require turbolinks

$(document).ready(function () {
    
    $("#timedout").hide();
    
//    $("button").click(function(){
//        $.ajax({url:"demo_test.txt", 
//            beforeSend:function(xhr) {
//                $("#spinner").show();
//            },
//         complete:function(xhr) {
//           $("#spinner").delay(3000).hide();
//         },
//          success:function(result){
//            $("#div1").html(result);
//              },
//          error:function(xhr){
//              alert("An error occured: " + xhr.status + " " + xhr.statusText);
//          }
//        });
//    });
});


$(function() {
    
    $("input").bind("keypress", function(e) {
        if (e.keyCode == 13){
            if ($(this).attr("name") == "user[password]" || $(this).attr("name") == "user[name]"){
                return true;
            } else {
                return false;
            } 
        }
//        if ($(this).attr("value") == "Log In"){
//            if (e.keyCode == 13) return true;
//        } else{
//            if (e.keyCode == 13) return false;
//        }
    });
 
});

//function disableEnterKey(e)
//{
//     var key;
//
//     if(window.event)
//          key = window.event.keyCode;     //IE
//     else
//          key = e.which;     //firefox
//
//     if(key == 13)
//          return false;
//     else
//          return true;
//}

//<input type=”text” name=”mytext” onKeyPress=”return disableEnterKey(event)”>
