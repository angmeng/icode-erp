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
//= require dataTables/jquery.dataTables
//= require_tree .
//= require turbolinks

//= require jquery-ui


$(document).ready(function () {
    
    var window_height           = $(window).height();
    var mainHeader_height       = $("#main_header").height();
    var mainFooter_height       = $("#main_footer").height();
    var menu_height             = $("#menu").height();
    var linking_height          = $("#linking").height();
    var title_height            = $(".title_head").height();
    var button_height           = $(".icon_tag").height();
    
    var ctn_width               = $(".title_head").width() - 10; // It is for table width
    
    // Wrapper is calculate the height only available when without popup
    var wrapper_height          = window_height - mainHeader_height - mainFooter_height - menu_height - 25;
    var content_height          = wrapper_height - title_height - button_height - 12;
    var linking_content_height  = wrapper_height - linking_height - title_height - button_height - 13;

    // It is for normal page for without popup
    $("#main_wrapper").css({ 'height': wrapper_height }).addClass("page_wrapper"); 
    
    // It is for .content
    $(".content").css({ 'height': content_height }).addClass("page_wrapper");
    
    // It is for .content with linking
    $(".linking_content").css({ 'height': linking_content_height }).addClass("page_wrapper");
    
    // Normal Table for main screen, no linking
    $("#jgrid").chromatable({
        width:  ctn_width,
        height: content_height,
        scrolling: "yes"
    });
    
    // Normal Table with linking
    $("#jgrid_linking").chromatable({
        width:  ctn_width,
        height: linking_content_height,
        scrolling: "yes"
    });
    
    // Here is Product Popup Module
    var popup_content_height    = window_height - title_height - button_height - 12;
    var popup_tab_height        = popup_content_height - 50;
    
    $("#treeview").kendoTreeView().height(popup_content_height);  
    $("#horizontal").css({ 'height': popup_content_height }).css({ 'margin': '0 auto' });   // It is for popup product page
    


  $('#products').dataTable()
  // {
  //       sPaginationType: "full_numbers",
  //       bJQueryUI: true,
  //       bProcessing: true,
  //       bServerSide: true,
  //       //sAjaxSource: $('#products').data('source')
  //    });

    // When it is popup...
    // We setting the time out because IE9 really damn high time speed, so we delay time to 0.1s
    setTimeout(function(){
            var window_height           = $(window).height();
            var ctn_width               = $(".title_head").width() - 10;
            var title_height            = $(".title_head").height();
            var button_height           = $(".icon_tag").height();
            var table_detail_height     = $(".table_details").height();
            var popup_content_height    = window_height - title_height - button_height - 12;
            var popup_tab_height        = popup_content_height - 50;
            var popup_form_table_height = popup_content_height - table_detail_height - 15;
            
            // It is for popup normal page
            $(".popup_content").css({ 'height': popup_content_height }).addClass("page_wrapper"); 
            $(".popup_form_table").css({ 'height': popup_form_table_height }).addClass("page_wrapper"); 
            
            // IMS - User Account
            $("#name_entry").height(popup_tab_height).addClass("page_wrapper");
            
            // Popup Tabbing Table -- IMS
            $("#ims_purchase, #ims_product").chromatable({
                width:  "-20",
                height: popup_tab_height,
                scrolling: "yes"
            });
            
            // Popup Tabbing Table -- IMS
            $(".jgrid_popup").chromatable({
                width:  ctn_width,
                height: popup_form_table_height,
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
