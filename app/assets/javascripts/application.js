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
    });
 
});

//$(document).ready(function() {
//    $("#vertical").kendoSplitter({
//        orientation: "vertical",
//        panes: [
//            { collapsible: false },
//            { collapsible: false, size: "100px" },
//            { collapsible: false, resizable: false, size: "100px" }
//        ]
//    });
//
//    $("#horizontal").kendoSplitter({
//        panes: [
//            { collapsible: true, size: "220px" },
//            { collapsible: false },
//            { collapsible: true, size: "220px" }
//        ]
//    });
//});
