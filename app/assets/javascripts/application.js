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

//= require jquery-ui
//= require autocomplete-rails

$(document).ready(function () {
    
    var window_height           = $(window).height();     //same with $("#page_height").height();
    var header_height           = $("#main_header").height();
    var footer_height           = $("#footer").height();
    var menu_height             = $("#menu").height();
    var ctn_width               = $("#container").width() - 20;
    var title_height            = $(".title_head").height();
    var button_height           = $(".icon_tag").height();
    var wrapper_height          = window_height - header_height - footer_height - menu_height - 25;
    var content_height          = wrapper_height - title_height - button_height - 12;

    // It is for normal page
    $("#wrapper").css({ 'height': wrapper_height }).addClass("page_wrapper"); 

    // Normal Table
    $("#jgrid").chromatable({
        width:  ctn_width,
        height: content_height,
        scrolling: "yes"
    });

    // Normal Content
    $(".content").css({ 'height': content_height }).addClass("page_wrapper");




    
    var popup_content_height    = window_height - title_height - button_height - 12;
    var popup_tab_height        = popup_content_height - 50;
    // It is for popup product page
    $("#horizontal").css({ 'height': popup_content_height }).css({ 'margin': '0 auto' });
    
    // We setting the time out because IE9 really damn high time speed, so we delay time to 0.1s
    setTimeout(function(){
            var window_height           = $(window).height();     //same with $("#page_height").height();
            var title_height            = $(".title_head").height();
            var button_height           = $(".icon_tag").height();

            // Here is popup module
            var popup_content_height    = window_height - title_height - button_height - 12;
            var popup_tab_height        = popup_content_height - 50;

            // It is for popup normal page
            $(".popup_content").css({ 'height': popup_content_height }).addClass("page_wrapper"); 

            // Popup Tabbing Table -- IMS
            $("#ims_purchase, #ims_product").chromatable({
                width:  ctn_width,
                height: popup_tab_height,
                scrolling: "yes"
            });
    }, 100);
    

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
