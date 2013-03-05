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
    
    // Here must be bottom script.. Dont do it at top script
    var window_height       = $(window).height();     //same with $("#page_height").height();
    var main_header         = $("#main_header").height();
    var main_footer         = $("#footer").height();
    var menu                = $("#menu").height();
    var container           = window_height - main_header - main_footer - menu - 25;
    
    $("#wrapper").css({ 'height': container }).addClass("page_wrapper"); 
    
    var ctn_width           = $("#container").width() - 20;
    var title_height        = $(".title_head").height();
    var button_height       = $(".icon_tag").height();
    var table_height        = container - title_height - button_height - 10;
    
//    alert(button_height);
    
    $("#jgrid").chromatable({
//        width:  ctn_width,
//        height: ctn_height,
        width:  ctn_width,
        height: table_height,
        scrolling: "yes"
    });
    
    

//    var ctn_height      = $("#container").height();
//    var popup_height    = $(window).height();
//    var footer_height   = $("#footer").height();
//    var icon_height     = $(".icon_tag").height();
//    var ctn_height      = ctn_height - footer_height - icon_height - 10;
//    var sheetbox        = popup_height - icon_height - 40;
//    
//    $("#jgrid").chromatable({
//        width:  ctn_width,
//        height: ctn_height,
//        scrolling: "yes"
//    });	
//    
//    $("#auto_height").height(ctn_height);
//    $("#sheetbox_height").height(sheetbox);
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
