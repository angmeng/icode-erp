$(document).ready(function() {
    
    $("#grid_userTable_h490").chromatable({
        width: "1200px",
        height: "490px",
        scrolling: "yes"
    });

    $("#grid_h295").chromatable({
        width: "1400px",
        height: "295px",
        scrolling: "yes"
    });	
    
    $("#delivery_order_h200").chromatable({
        width: "2000px",
        height: "200px",
        scrolling: "yes"
    });	
    
    $("#grid_h320").chromatable({
        width: "1340px",
        height: "320px",
        scrolling: "yes"
    });	
    
    $("#grid_h370").chromatable({
        width: "1340px",
        height: "370px",
        scrolling: "yes"
    });	
    
    $("#grid_h390").chromatable({
        width: "1340px",
        height: "390px",
        scrolling: "yes"
    });	
    
    $("#grid_h445").chromatable({
        width: "1400px",
        height: "445px",
        scrolling: "yes"
    });	
    
    $("#grid_h490").chromatable({
        width: "1410px",
        height: "490px",
        scrolling: "yes"
    });	
    
    $("#grid_h495").chromatable({
        width: "1330px",
        height: "495px",
        scrolling: "yes"
    });
    
    $("#grid_h400").chromatable({
        width: "1330px",
        height: "400px",
        scrolling: "yes"
    });
    
    $("#grid_h430").chromatable({
        width: "1330px",
        height: "430px",
        scrolling: "yes"
    });
    
    

    $("#autowidth_h400").chromatable({
        width: "1510px",
        height: "400px",
        scrolling: "yes"
    });
    
//    $('input[class^="company_sales_"]').numberbox({min:0,  max: 999999});
//    $('input[class^="two_digit_"]').numberbox({min:0,  max: 99});
//    $('input[class^="three_digit_"]').numberbox({min:0,  max: 999});
//    $('input[class^="ten_digit_"]').numberbox({min:0,  max: 9999999999});
//    $('input[class^="five_digit_"]').numberbox({min:0,  max: 99999});
//    $('#purchase_requisition_quantity').numberbox({min:0,  max: 99999});
//    $('input[class^="two_zero_"]').numberbox({min:0,  precision:2});
//    $('input[class^="three_zero"]').numberbox({min:0,  precision:3});
//    $('input[class^="four_zero"]').numberbox({min:0, precision:4});
//    $('input[class^="four_precision"]').numberbox({min:0, precision:4});
//    $('#product_part_weight, input[class^="six_zero"]').numberbox({min:0, precision:6}); 
//    $('#estimated_price, #purchase_requisition_item_unit_price, #receive_note_kgs, #unit_price').numberbox({min:0, precision:4}); 
//    $('#product_selling_price').numberbox({min:0, precision:5}); 
    
//    $.extend($.fn.validatebox.defaults.rules, {  
//        fixLength: {  
//            validator: function(value, param){  
//                return value.length === param[0];
//            }, 
//            message: 'Please enter full {0} characters.'  
//        },
//        maxLength: {  
//            validator: function(value, param){  
//                return value.length <= param[0];
//            }, 
//            message: 'Please enter full {0} characters.'  
//        }
//    }); 

    $("#menu").kendoMenu({ openOnClick: true });
    $("#treeview").kendoTreeView();
    $("#product_tabStrip, #purchase_order_tabStrip, #user_strip, #company_strip, #qr_strip").kendoTabStrip({animation: {open: {effects: "fadeIn"}}});
    $("#panelbar").kendoPanelBar({expandMode: "single"});
    $("#sales_order_trade_company_id").width(400);
    $("#custom_trade_company_id, #combox_company, #combo_ste, #vendor_id, #trade_company_sales_tax_exemption_id").kendoComboBox({filter: "contains"});
    
    $('input[class^="kendo_date_multiple"]').kendoDatePicker({ format: "dd-MM-yyyy" });
    $('select[class^="kendo_combobox_multiple"]').kendoComboBox({filter: "contains"});
    $("#kendo_date, #product_cutoff_date, #sales_order_item_eta, #purchase_order_po_date, #receive_note_rn_date, #search_po_date_gte, #search_po_date_lte, #search_rn_date_gte, #search_rn_date_lte, #incoming_reject_ir_date, #quotation_request_form_qrf_date").kendoDatePicker({ format: "dd-MM-yyyy" }); 
    $("#kendo_combobox, #kendo_combobox_two").kendoComboBox({filter: "contains"});
    $("#kendo_price").kendoNumericTextBox({ min: 0, decimals: 4, format: "n4" });
    
    // Just autocomplete all suppliers only
    $("#autoComplete_suppliers").kendoAutoComplete({    
        minLength: 2,
        filter: "contains",
        dataTextField: "company_name", // use JSON property name
        dataSource: new kendo.data.DataSource({
            type: "json", // specifies data protocol
            transport: {read: "/trade_companies/all_suppliers.json"}
        })
    })
    
    // Just autocomplete all customers only
    $("#autoComplete_customers").kendoAutoComplete({
        minLength: 2,
        filter: "contains",
        dataTextField: "company_name", // use JSON property name
        dataSource: new kendo.data.DataSource({
            type: "json", // specifies data protocol
            transport: {read: "/trade_companies/all_customers.json"}
        })
    })
    
    // Just autocomplete all suppliers de product id de description only
    $("#autoComplete_suppliers_product_description").kendoAutoComplete({
        minLength: 2,
        dataTextField: "description", // use JSON property name
        dataSource: new kendo.data.DataSource({
            type: "json", // specifies data protocol
            transport: {read: "/product_comboboxes/supplier_product_description.json"}
        })
    })
    
    $(".pr_iframe, .ste_iframe, .iframe_1600x900").fancybox({
            maxWidth	: 1600,
            maxHeight	: 900,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic',
            afterClose  : function() {location.reload();return false;}
    });
    
    $(".ste_iframe_800x450, .inventory_iframe_800x450, .iframe_800x450").fancybox({
            maxWidth	: 800,
            maxHeight	: 450,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic',
            afterClose  : function() {location.reload();return false;}
    });
    
    $(".iframe_800x600").fancybox({
            maxWidth	: 800,
            maxHeight	: 600,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic',
            afterClose  : function() {location.reload();return false;}
    });
    
    $(".rn_iframe, .ir_iframe, .iframe_1024x800").fancybox({
            maxWidth	: 1024,
            maxHeight	: 800,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic',
            afterClose  : function() {location.reload();return false;}
    });
    
    $(".show_without_refresh_page_1600x900").fancybox({
            maxWidth	: 1600,
            maxHeight	: 900,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic'
    });
    
    $(".show_without_refresh_page_800x450").fancybox({
            maxWidth	: 800,
            maxHeight	: 450,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic'
    });
    
    $(".show_without_refresh_page_800x600").fancybox({
            maxWidth	: 800,
            maxHeight	: 600,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic'
    });
    
    $(".show_without_refresh_page_1024x800").fancybox({
            maxWidth	: 1024,
            maxHeight	: 800,
            fitToView	: false,
            width	: '100%',
            height	: '100%',
            autoSize	: false,
            closeClick	: false,
            openEffect	: 'elastic',
            closeEffect	: 'elastic'
    });

    $(".pr_items_click").click(function() {$("#pr_items_show").window('open');});
    $('#on_button_one, #on_button_two').click(function() {$("#pr_items_show").window('close');});
    $("#edit_pr").click(function() {$("#show_trade_company_name").show();});
    
    $(".pr_remark_one_link").click(function() {$("#pr_remark_one").window('open');});
    $(".pr_remark_om_link").click(function() {$("#pr_remark_om").window('open');});
    $(".pr_remark_three_link").click(function() {$("#pr_remark_three").window('open');});
    
    $(".click_no_remark").click(function() {$(".show_approval").show();$(".show_yes_button").hide();});
    $(".click_cancel_button").click(function() {$(".show_approval").hide();});
    $(".click_yes_approval").click(function() {$(".show_yes_button").show();$(".show_approval").hide();});
    $(".click_close_button").click(function() {$(".show_yes_button").hide();});
    
    $(".pop_remark").click(function() {$("#qr_remark").window('open');});
    
    $(".search_link").click(function() {$(".search_engine").toggle();});
    
    $("#notice, #alert").click(function() {$("#notice, #alert").hide();});
    
    $(".click_maintenance").click(function() { 
        var item_no = $(this).attr("item");
        $("#purchase_requisition_item_id").val(item_no);
        $("#pop_maintenance").window('open'); 
    });
    
    $("#maintenance").click(function(){
        if ($(this).is(":checked"))
        {
            $(".new_product_cp").hide();
            $(".new_product_up").hide();
            $(".new_product_etp").hide();
        }
        else
        {
            $(".new_product_cp").show();
            $(".new_product_up").show();
            $(".new_product_etp").show();
        }
    });
    
    $("#product_opening_stock").keyup(function(){
          var num = $(this).val();
          $(".current_stock_val").html(num);
          return false;
    });
    
    $("#purchase_order_tax, #tax").keyup(function(){
        a = parseInt($(this).val());
        b = a / 100
        c = +($(".po_subtotal").attr("title")); 
        d = c + c * b;
        
        $(".add_s_tax").html(b.toFixed(2));
        $(".po_grandtotal").html(d.toFixed(2));
        $("#po_percent").html(a);
    });
    
    $("#receive_note_received_qty").keyup(function(){
        var receive_qty = +($(this).val());
        var order_qty = +$("#receive_note_order_qty").val();
        balance_qty = order_qty - receive_qty;
        $(".bal_qty").html(balance_qty);
    });
    
    $("#incoming_reject_returned_qty").keyup(function(){
        var returned_qty = +($(this).val());
        var order_qty = +$("#incoming_reject_order_qty").val();
        balance_qty = order_qty - returned_qty;
        $(".bal_qty_ir").html(balance_qty);
    });
                                             
    $("#purchase_requisition_item_quantity, #estimated_price").keyup(function(){
        var estimated_qty         = $("#purchase_requisition_item_quantity").val();
        var estimated_price       = $("#estimated_price").val();
        var estimated_total_price = parseInt(estimated_qty) * parseFloat(estimated_price);
        $("#estimated_total_price").html(estimated_total_price.toFixed(4));
    });
    
    $("#quotation_request_form_quantity, #quotation_request_form_unit_price").keyup(function(){
        var quotation_qty         = $("#quotation_request_form_quantity").val();
        var unit_price            = $("#quotation_request_form_unit_price").val();
        var total_price = parseInt(quotation_qty) * parseFloat(unit_price);
        $("#total_quotation").html(total_price.toFixed(4));
    });
    
//    $("#purchase_requisition_item_quantity").keyup(function(){
//        var real_qty         = $(this).val();
//        var unit_price       = $("#data_up").html();
//        var total_price      = parseInt(real_qty) * parseFloat(unit_price);
//        $("#data_total_price").html(total_price.toFixed(2));
//    });
    
    $("#sales_order_item_quantity").keyup(function(){
        var qty           = $(this).val();
        var selling_price = $("#display_sp").html();
        amount_price      = parseInt(qty) * parseFloat(selling_price);
        $(".amount_price").html(amount_price.toFixed(2));
    });
    
//////////////////////////// Barcode Start ///////////////////////////////////
    $("#other_barcode").click(function() { 
        $("#quotation_request_form_barcode_other").attr("checked", true);
    });
    
    $("#quotation_request_form_barcode_ean13, #quotation_request_form_barcode_upca, #quotation_request_form_barcode_code128, #quotation_request_form_barcode_code39, #quotation_request_form_barcode_other").click(function() { 
        $("#other_barcode").val(''); 
    });
//////////////////////////// Barcode End   ///////////////////////////////////

//////////////////////////// Surface Start ///////////////////////////////////
    $("#quotation_request_form_varnish_full").click(function() { 
        $("#quotation_request_form_surface_remark").val('').attr("disabled", true);
    });
    
    $("#quotation_request_form_varnish_spot").click(function() { 
        $("#quotation_request_form_surface_remark").val('').attr("disabled", false);
    });
//////////////////////////// Surface End   ///////////////////////////////////

//////////////////////////// Lamination start //////////////////////////////////////
    $("#quotation_request_form_lamination_full").click(function() { 
        $("#quotation_request_form_lamination_remark").val('').attr("disabled", true);
    });
    
    $("#quotation_request_form_lamination_spot").click(function() { 
        $("#quotation_request_form_lamination_remark").val('').attr("disabled", false);
    });
    
    $("#quotation_request_form_lamination_remark").click(function() { 
        $("#quotation_request_form_lamination_spot").attr("checked", true);
    });

    $("#quotation_request_form_lamination_type_joints").click(function() { 
        $("#quotation_request_form_lamination_type_flute").attr("checked", true);
        loading_flute();
    });
    
    $("#quotation_request_form_lamination_type_flute").click(function(){
        loading_flute();
    });

    $("#quotation_request_form_lamination_type_opp_gloss, #quotation_request_form_lamination_type_opp_matt").click(function() { 
        disabled_flute();
        $("#quotation_request_form_lamination_type_joints").val('0');
    }); 
    
    $("#quotation_request_form_lamination_type_joints").blur(function() { 
        var joint_no = $(this).val();
        if (joint_no <= 2){

            if (joint_no != ''){
                $("#generate_flute_size").empty();
                $("#mould_no, #window_no").empty();
                for(var i = 0; i <= joint_no; i++) {
                    $("#generate_flute_size").append('(W)<input id="generate_flute_width_" size="5" type="text" name="generate_flute_width[' + i + '][val]">');
                    $("#generate_flute_size").append('(L)<input id="generate_flute_length_" size="5" type="text" name="generate_flute_length[' + i + '][val]"><br/');
                    $("#mould_no").append('<input id="mould_no_" size="10" type="text" name="mould_no[' + i + '][val]">');
                    $("#window_no").append('<input id="window_no_" size="10" type="text" name="window_no[' + i + '][val]">');
                }
            } else {
                    $("#quotation_request_form_lamination_type_joints").val('0');
                    $("#generate_flute_size").append('(W)<input id="generate_flute_width_" size="5" type="text" name="generate_flute_width[1][val]">');
                    $("#generate_flute_size").append('(L)<input id="generate_flute_length_" size="5" type="text" name="generate_flute_length[1][val]">');
                    $("#mould_no").append('<input id="mould_no_" size="10" type="text" name="mould_no[1][val]">');
                    $("#window_no").append('<input id="window_no_" size="10" type="text" name="window_no[1][val]">');
            }

        } else {
            alert("Flute Joint should less than or equal to 2.");
        }
    });
    
    $("#quotation_request_form_flute_type_b-flute, #quotation_request_form_flute_type_e-flute").click(function(){
        $("#quotation_request_form_flute_type_other").val('');
    });
    
    $("#quotation_request_form_flute_type_other").click(function(){
        $("#quotation_request_form_flute_type_others").attr("checked", true);
        $("#quotation_request_form_flute_type_b-flute").attr("checked", false);
        $("#quotation_request_form_flute_type_e-flute").attr("checked", false);
    });
    
    $("#quotation_request_form_flute_material_2626, #quotation_request_form_flute_material_2633, #quotation_request_form_flute_material_3333").click(function(){
        $("#quotation_request_form_flute_material_other").val('');
    });
    
    $("#quotation_request_form_flute_material_other").click(function(){
        $("#quotation_request_form_flute_material_2626").attr("checked", false);
        $("#quotation_request_form_flute_material_2633").attr("checked", false);
        $("#quotation_request_form_flute_material_3333").attr("checked", false);
        $("#quotation_request_form_flute_material_others").attr("checked", true);
    });
//////////////////////////// Lamination end ///////////////////////////////////////

//////////////////////////// Die Cut start
    $("#other_die_cut").click(function() { 
        $("#quotation_request_form_die_cut_type_interlock").attr("checked", false);
        $("#quotation_request_form_die_cut_type_flat").attr("checked", false);
        $("#quotation_request_form_die_cut_type_butterfly").attr("checked", false);
        $("#quotation_request_form_die_cut_type_other").attr("checked", true);
    });

    $("#quotation_request_form_die_cut_type_interlock, #quotation_request_form_die_cut_type_flat, #quotation_request_form_die_cut_type_butterfly").click(function() { 
        $("#other_die_cut").val('');
    }); 
//////////////////////////// Die Cut end
    
//////////////////////////// Window Shape Start /////////////////////////////////////
    $("#window_shape_other").click(function() { 
        $("#quotation_request_form_window_shape_rectangle").attr("checked", false);
        $("#quotation_request_form_window_shape_kidney").attr("checked", false);
        $("#quotation_request_form_window_shape_oval").attr("checked", false);
        $("#quotation_request_form_window_shape_triangle").attr("checked", false);
        $("#quotation_request_form_window_shape_other").attr("checked", true);
    });
    
    $("#quotation_request_form_window_shape_rectangle, #quotation_request_form_window_shape_kidney, #quotation_request_form_window_shape_oval, #quotation_request_form_window_shape_triangle").click(function() { 
        $("#window_shape_other").val(''); 
    });
    
    $("#quotation_request_form_window_patching_false").click(function() { 
        $("#quotation_request_form_window_patching_type_opp_film").attr("checked", false).attr("disabled", true);
        $("#quotation_request_form_window_patching_type_plain_film").attr("checked", false).attr("disabled", true);
        $("#quotation_request_form_window_patching_type_plastic_sheet").attr("checked", false).attr("disabled", true);
        $("#quotation_request_form_window_patching_type_pre_print").attr("checked", false).attr("disabled", true);
        $("#quotation_request_form_pre_print_textbox").val('').attr("disabled", true);
        $("#quotation_request_form_window_patching_type_others").attr("checked", false).attr("disabled", true);
        $("#other_window_patching").val('').attr("disabled", true);        
        $("#quotation_request_form_window_width").val('').attr("disabled", true);
        $("#quotation_request_form_window_length").val('').attr("disabled", true);
        $("#quotation_request_form_window_usage").val('').attr("disabled", true);
    });
    
    $("#quotation_request_form_window_patching_true").click(function() { 
        $("#quotation_request_form_window_patching_type_opp_film").attr("disabled", false);
        $("#quotation_request_form_window_patching_type_plain_film").attr("disabled", false);
        $("#quotation_request_form_window_patching_type_plastic_sheet").attr("disabled", false);
        $("#quotation_request_form_window_patching_type_pre_print").attr("disabled", false);
        $("#quotation_request_form_pre_print_textbox").val('').attr("disabled", false);
        $("#quotation_request_form_window_patching_type_others").attr("disabled", false);
        $("#other_window_patching").attr("disabled", false); 
        $("#quotation_request_form_window_width").attr("disabled", false);
        $("#quotation_request_form_window_length").attr("disabled", false);
        $("#quotation_request_form_window_usage").attr("disabled", false);
    });
    
    $("#other_window_patching").click(function() { 
        $("#quotation_request_form_window_patching_type_opp_film").attr("checked", false);
        $("#quotation_request_form_window_patching_type_plain_film").attr("checked", false);
        $("#quotation_request_form_window_patching_type_plastic_sheet").attr("checked", false);
        $("#quotation_request_form_window_patching_type_pre_print").attr("checked", false);
        $("#quotation_request_form_pre_print_textbox").val(''); 
        $("#quotation_request_form_window_patching_type_others").attr("checked", true);
    });
    
    $("#quotation_request_form_pre_print_textbox").click(function() { 
        $("#quotation_request_form_window_patching_type_opp_film").attr("checked", false);
        $("#quotation_request_form_window_patching_type_plain_film").attr("checked", false);
        $("#quotation_request_form_window_patching_type_plastic_sheet").attr("checked", false);
        $("#quotation_request_form_window_patching_type_pre_print").attr("checked", true);
        $("#quotation_request_form_window_patching_type_others").attr("checked", false);
        $("#other_window_patching").val(''); 
    });

    $("#quotation_request_form_window_patching_type_opp_film, #quotation_request_form_window_patching_type_plain_film, #quotation_request_form_window_patching_type_pre_print, #quotation_request_form_window_patching_type_plastic_sheet, #quotation_request_form_window_patching_type_others").click(function() { 
        $("#quotation_request_form_pre_print_textbox").val('');
        $("#other_window_patching").val('');
    });
//////////////////////////// Window Shape End 



//////////////////////////// Packing start
    $("#quotation_request_form_packing_type_other").click(function() { 
        $("#quotation_request_form_packing_type_bulk").attr("checked", false);
        $("#quotation_request_form_packing_type_packet").attr("checked", false);
        $("#quotation_request_form_packing_type_carton").attr("checked", false);
        $("#quotation_request_form_packing_type_bin").attr("checked", false);
        $("#quotation_request_form_packing_type_others").attr("checked", true);
    });

    $("#quotation_request_form_packing_type_bulk, #quotation_request_form_packing_type_packet, #quotation_request_form_packing_type_carton, #quotation_request_form_packing_type_bin").click(function() { 
        $("#quotation_request_form_packing_type_other").val('');
    }); 
//////////////////////////// packing end

///////////////////////////////////////////////// It is use for button script /////////////////////////////////////////////
    $(".zebraLight tr").mouseover(function(){$(this).addClass("over");}).mouseout(function(){$(this).removeClass("over");});

    $('.zebraLight tr').click(function() {
        $(this).parent().children().each(function(){
            $(this).removeClass('selected_row');
            $(this).find('img').remove();
        });
        $(this).addClass('selected_row');  
        $(this).find('td:first').html("<img src='/assets/checking.png' width='15' height='15' />");
        var controller_Name = $(this).attr("controllerName");
      
        var row_id = $(this).attr("rowsId");
        
        if(row_id) {
            var add_class = $("#on_add_customer, #on_add_product").attr("addClass");
            var show_class = $("#on_show, #on_show_kiv").attr("showClass");
            var edit_class = $("#on_edit").attr("editClass");
            var apply_class = $("#on_apply, #on_add_product_id").attr("applyClass");
            var apply_vendor_select_class = $("#on_apply_vendor_select").attr("applyClass");
            var apply_proposed_vendor_class = $("#on_apply_proposed_vendor").attr("applyClass");
            var apply_vendor_reg_class = $("#on_apply_vendor_reg").attr("applyClass");
            var apply_make_po_class = $("#on_apply_make_po").attr("applyClass");
            var cost_class = $("#on_cost").attr("costClass");
            
            var link_show      = "/" + controller_Name + "/" + row_id;
            var link_edit      = "/" + controller_Name + "/" + row_id + "/edit";
            var link_kiv       = "/" + controller_Name + "/" + row_id;
            var link_moving_kiv = "/" + controller_Name + "/" + row_id + "/moving_kiv";            
            var link_printable = "/" + controller_Name + "/" + row_id + '.pdf';
            var link_printable_qr = "/" + controller_Name + "/" + row_id + '/printable.pdf';
            var link_printable_cs = "/" + controller_Name + "/" + row_id + '/printable.pdf';
            var link_show_kiv  = "/" + controller_Name + "/" + row_id;
            var link_recover   = "/" + controller_Name + "/" + row_id + "/recover";
            var link_remove    = "/" + controller_Name + "/" + row_id + "/" + "remove_pr"; //purchase_requisition_items
            var link_apply     = "/" + controller_Name + "/" + row_id + "/" + "display_maintenance";
            var link_submit_to = "/" + controller_Name + "/" + row_id + "/" + "submit_vselect";
            var link_apply_vendor_select = "/" + controller_Name + "/" + row_id + "/" + "show_select_vendor";
            var link_apply_proposed_vendor = "/" + controller_Name + "/select_vendor?id=" + row_id;
            var link_submit_proposed_vendor = "/" + controller_Name + "/" + row_id + "/proposed_approval";
            var link_apply_vendor_reg = "/" + controller_Name + "/new?temp_source_id=" + row_id;
            var link_apply_make_po = "/" + controller_Name + "/new?company_id=" + row_id;
            var link_printable_po = "/" + controller_Name + "/" + row_id + "/printable.pdf";
            var link_show_history = "/" + controller_Name + "/" + row_id + "/display_items";
            var link_mail = "/" + controller_Name + "/" + row_id + "/mailing";
            var link_add_customer = "/trade_companies/new?option=CUSTOMER" + "&qr_id=" + row_id;
            var link_add_product = "/products/finish_good?qr_id=" + row_id;
//            var link_add_product = "/products/finish_good";
            var link_costing = "/costing_sheets?id=" + row_id;
            var link_add_product_id = "/products/message?pri_id=" + row_id;

            html_show = "<a class='k-button " + show_class + "'  data-fancybox-type='iframe' href=" + link_show  + "><b>Show</b></a>"
            html_edit = "<a class='k-button " + edit_class + "' data-fancybox-type='iframe' href=" + link_edit + "><b>Edit</b></a>"
            html_kiv = "<a rel='nofollow' class='k-button' data-method='delete' data-confirm='Are you sure move to KIV?' href=" + link_kiv + "><b>Drop to KIV</b></a>"
            html_moving_kiv = "<a data-confirm='Are you sure move to KIV?' class='k-button' href=" + link_moving_kiv + "><b>Drop to KIV</b></a>"
            html_pdf = "<a target='_blank' class='k-button' href=" + link_printable + "><b>Printer</b></a>"
            html_pdf_qr = "<a target='_blank' class='k-button' href=" + link_printable_qr + "><b>Printer</b></a>"
            html_pdf_cs = "<a target='_blank' class='k-button' href=" + link_printable_cs + "><b>Printer</b></a>"
            html_show_kiv = "<a class='k-button " + show_class + "' data-fancybox-type='iframe' href=" + link_show_kiv  + "><b>Show KIV</b></a>"
            html_recover = "<a rel='nofollow' class='k-button' data-method='put' data-confirm='Are you sure to recover?' href=" + link_recover + "><b>Recover</b></a>"
            html_remove = "<a href='" + link_remove + "' data-confirm='Are you sure to remove?' data-method='put' rel='nofollow' class='k-button'>" + "<b>Remove</b></a>"
            html_apply = "<a class='k-button " + apply_class + "' data-fancybox-type='iframe' href=" + link_apply + "><b>Apply</b></a>"
            html_submit_to = "<a rel='nofollow' class='k-button' data-method='put' data-confirm='Are you confirm submit to Vendor Selection?' href=" + link_submit_to + "><b>Submit to</b></a>"
            html_vendor_select = "<a class='k-button " + apply_vendor_select_class + "' data-fancybox-type='iframe' href=" + link_apply_vendor_select + "><b>Apply</b></a>"
            html_apply_proposed_vendor = "<a class='k-button " + apply_proposed_vendor_class + "' data-fancybox-type='iframe' href=" + link_apply_proposed_vendor + "><b>Add New Sources</b></a>"
            html_submit_proposed_vendor = "<a rel='nofollow' class='k-button' data-method='put' data-confirm='Are you confirm submit to Vendor Selection?' href=" + link_submit_proposed_vendor + "><b>Submit to Vendor Selection</b></a>"
            html_vendor_reg = "<a class='k-button " + apply_vendor_reg_class + "' data-fancybox-type='iframe' href=" + link_apply_vendor_reg + "><b>Add New Vendor</b></a>"                          
            html_make_po = "<a class='k-button " + apply_make_po_class + "' data-fancybox-type='iframe' href=" + link_apply_make_po + "><b>Add New PO</b></a>"
            html_printable_po = "<a target='_blank' class='k-button' href=" + link_printable_po + "><b>Printer</b></a>"
            html_ste_show_history = "<a class='show_without_refresh_page_1600x900 k-button' data-fancybox-type='iframe' href=" + link_show_history + "><b>Show Histories for Suppliers</b></a>"
            html_mail = "<a class='iframe_800x450 k-button' data-fancybox-type='iframe' href=" + link_mail + "><b>Mail</b></a>"
            html_add_customer = "<a class='k-button " + add_class + "' data-fancybox-type='iframe' href=" + link_add_customer + "><b>Add New Customer</b></a>"
            html_add_product = "<a class='k-button " + add_class + "' data-fancybox-type='iframe' href=" + link_add_product + "><b>Add New Product</b></a>"
            html_costing = "<a class='k-button " + cost_class + "' data-fancybox-type='iframe' href=" + link_costing + "><b>Costing Sheet</b></a>"
            html_add_product_id = "<a class='k-button " + apply_class + "' data-fancybox-type='iframe' href=" + link_add_product_id + "><b>Apply the Product ID Registration</b></a>"
            
            $("#on_show").html(html_show);
            $("#on_edit").html(html_edit);
            $("#on_kiv").html(html_kiv);
            $("#on_move_kiv").html(html_moving_kiv);
            $("#on_printable").html(html_pdf);
            $("#on_printable_qr").html(html_pdf_qr);
            $("#on_printable_cs").html(html_pdf_cs);
            $("#on_show_kiv").html(html_show_kiv);
            $("#on_recover").html(html_recover);
            $("#on_remove").html(html_remove);
            $("#on_apply").html(html_apply);
            $("#on_submit_to").html(html_submit_to);
            $("#on_apply_vendor_select").html(html_vendor_select);
            $("#on_apply_proposed_vendor").html(html_apply_proposed_vendor);
            $("#on_submit_proposed_vendor").html(html_submit_proposed_vendor);
            $("#on_apply_vendor_reg").html(html_vendor_reg);
            $("#on_apply_make_po").html(html_make_po);
            $("#on_printable_po").html(html_printable_po);
            $("#on_show_history").html(html_ste_show_history);
            $("#on_add_customer").html(html_add_customer);
            $("#on_add_product").html(html_add_product);
            $("#on_cost").html(html_costing);
            allow_mail(row_id, html_mail);
            $("#on_add_product_id").html(html_add_product_id);
        };
    });



//================================= INVENTORY MANAGEMENT SYSTEM - CHECKBOXES =================================================
    $('input:checkbox[name="inventory_management_system[]"]').click(function() {
        var checkbox_value = $(this).attr("value");
        var checked = $(this).is(':checked');
//        alert(checkbox_value);
        
        switch (parseInt(checkbox_value)) {
            case 2:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '6')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '7')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '8')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '9')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '6')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '7')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '8')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '9')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '10') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 131:
                if (checked == true){ 
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '132') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '133') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '132') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '133') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '134') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 3:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '11') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '13') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '11') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '13') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '14') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 4:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '15') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '15') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '16') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 5:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '17') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '17') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '18') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 20:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '129') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '129') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 21:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '28') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '29') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '28') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '29') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 22:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '31') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '32') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '31') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '32') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 23:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '34') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '34') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 24:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '37') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '37') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 25:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '40') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '40') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 26:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '43') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '45') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '43') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '44') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '45') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '46') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 27:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '47') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '47') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '48') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 50:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '54') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '54') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 51:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '55') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '57') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '55') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '56') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '57') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '58') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 52:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '130') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '130') {$(this).attr('checked', false);}
                    })
                }
                break;

            case 63:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '67') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '69') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '67') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '68') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '69') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '70') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 65:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '75') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '75') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '76') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 225:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '228') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '229') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '230') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '228') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '229') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '230') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '231') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 227:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '237') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '237') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '238') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 78:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '81') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '81') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 79:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '82') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '82') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '83') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '85') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 89:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '90') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '90') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '91') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '92') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '93') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 97:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '100') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '100') {$(this).attr('checked', false);}
                    });
                }
                break;
                
            case 98:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '101') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '127') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '101') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '102') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '127') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '103') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 99:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '104') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '104') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '105') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 106:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '109') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '109') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 107:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '110') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '128') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '110') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '111') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '128') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '112') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 108:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '113') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '113') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '114') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 139:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '122') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '123') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '124') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '125') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '126') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '215') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '216') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '122') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '123') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '124') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '125') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '126') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '215') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '259') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 140:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '142') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '143') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '144') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '145') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '146') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '218') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '219') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '142') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '143') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '144') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '145') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '146') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '218') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '260') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 141:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '147') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '148') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '149') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '150') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '151') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '221') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '222') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '147') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '148') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '149') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '150') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '151') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '221') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '261') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 156:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '161') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '162') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '163') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '164') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '161') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '162') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '163') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '164') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 158:
                if (checked == true){
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '166') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '167') {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '198') {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '166') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '167') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '168') {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '198') {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 159:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '169')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '171')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '173')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '169')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '170')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '171')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '172')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '173')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 174:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '175')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '176')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '177')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '211')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '175')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '176')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '177')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '178')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '211')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 160:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '179')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '179')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '180')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 181:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '182')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '182')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 183:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '184')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '184')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 185:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '157')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '186')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '187')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '188')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '157')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '186')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '187')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '188')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '189')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 190:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '191')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '191')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '192')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 193:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '194')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '195')  {$(this).attr('checked', true);}
                        else if ($(this).attr("value") == '196')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '194')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '195')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '196')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '197')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 206:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '204')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '204')  {$(this).attr('checked', false);}
                        else if ($(this).attr("value") == '205')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 209:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '210')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '210')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 212:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '217')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if      ($(this).attr("value") == '217')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 213:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '220')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '220')  {$(this).attr('checked', false);}
                    })
                }
                break;
              
            case 214:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if ($(this).attr("value") == '223')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if ($(this).attr("value") == '223')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 251:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '252')  {$(this).attr('checked', true);}
                        else if      ($(this).attr("value") == '253')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '252')  {$(this).attr('checked', false);}
                        else if      ($(this).attr("value") == '253')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 254:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '247')  {$(this).attr('checked', true);}
                        else if      ($(this).attr("value") == '248')  {$(this).attr('checked', true);}
                        else if      ($(this).attr("value") == '249')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '247')  {$(this).attr('checked', false);}
                        else if      ($(this).attr("value") == '248')  {$(this).attr('checked', false);}
                        else if      ($(this).attr("value") == '249')  {$(this).attr('checked', false);}
                        else if      ($(this).attr("value") == '250')  {$(this).attr('checked', false);}
                    })
                }
                break;
                
            case 255:
                if (checked == true){  
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '256')  {$(this).attr('checked', true);}
                    })
                } else {
                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
                        if           ($(this).attr("value") == '256')  {$(this).attr('checked', false);}
                        else if      ($(this).attr("value") == '257')  {$(this).attr('checked', false);}
                    })
                }
                break;
//                
//            case 248:
//                if (checked == true){  
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '243')  {$(this).attr('checked', true);}
//                    })
//                } else {
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '243')  {$(this).attr('checked', false);}
//                    })
//                }
//                break;
//                
//            case 249:
//                if (checked == true){  
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '245')  {$(this).attr('checked', true);}
//                    })
//                } else {
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '245')  {$(this).attr('checked', false);}
//                    })
//                }
//                break;
//                
//            case 250:
//                if (checked == true){  
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '237')  {$(this).attr('checked', true);}
//                    })
//                } else {
//                    $('input:checkbox[name="inventory_management_system[]"]').each( function() {
//                        if           ($(this).attr("value") == '237')  {$(this).attr('checked', false);}
//                    })
//                }
//                break;
                
            default:break;
        }
    });
//================================= INVENTORY MANAGEMENT SYSTEM - CHECKBOXES (END) ================================================

//================================= QUOTATION REQUEST FORM (START) ===============================================//
    $('input:checkbox[name="field_set[]"]').click(function() {
        var checkbox_value = $(this).attr("value");
        var checked = $(this).is(':checked');
//        alert(checkbox_value);

        switch(parseInt(checkbox_value)){
            /* Color Fieldset */
            case 1:
                if (checked == true){
//                    $('input:checkbox[name="field_set[]"]').each( function() {
                        $("#quotation_request_form_color_no").val('').attr('disabled', false);
                        $('input[id^="quotation_request_form_color_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#color_name").empty();
                        $("#color_code").empty();
                        $('input[id^="pre_print_type_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', false);
                        });
                        $("#pre_print_type_other").val('').attr('disabled', false);
                        $('input[id^="quotation_request_form_barcode_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', false);
                        });
                        $("#other_barcode").val('').attr("disabled", false);
                        $('input[id^="quotation_request_form_shortage_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', false);
                        });
//                    })
                } else {
//                    $('input:checkbox[name="field_set[]"]').each( function() {
                        $("#quotation_request_form_color_no").val('').attr('disabled', true);
                        $('input[id^="quotation_request_form_color_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#color_name").empty();
                        $("#color_code").empty();
                        $('input[id^="pre_print_type_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
                        $("#pre_print_type_other").val('').attr('disabled', true);
                        $('input[id^="quotation_request_form_barcode_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
                        $("#other_barcode").val('').attr("disabled", true);
                        $('input[id^="quotation_request_form_shortage_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
//                    })
                }
                break;
                
            /* Surface Fieldset */
            case 2:
                if (checked == true){
                        $('input[id^="quotation_request_form_varnish_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $('input[id^="varnish_type_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', false);
                        });
                        $("#quotation_request_form_surface_remark").val('').attr("disabled", false);
                } else {
                        $('input[id^="quotation_request_form_varnish_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $('input[id^="varnish_type_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
                        $("#quotation_request_form_surface_remark").val('').attr("disabled", true);
                }
                break;
               
            /* Lamination Fieldset */
            case 3:
                if (checked == true){                        
                        $('input[id^="quotation_request_form_lamination_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $('input[id^="quotation_request_form_lamination_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#quotation_request_form_lamination_type_joints").val('0').attr("disabled", false);
                } else {
                        $('input[id^="quotation_request_form_lamination_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $('input[id^="quotation_request_form_lamination_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#quotation_request_form_lamination_type_joints").val('0').attr("disabled", true);
                        $('input[id^="quotation_request_form_flute_type_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
                        $("#quotation_request_form_flute_type_other").val('').attr('disabled', true);
                        $('input[id^="quotation_request_form_flute_material_"]').each(function(){
                            $(this).attr('checked', false).attr('disabled', true);
                        });
                        $("#quotation_request_form_flute_material_other").val('').attr('disabled', true);
                        $("#quotation_request_form_lamination_remark").val('').attr("disabled", true);
                        $("#generate_flute_size").empty();
                        $("#generate_flute_size").append('(W)<input id="generate_flute_width_" size="5" type="text" disabled="true" name="generate_flute_width[1][val]">');
                        $("#generate_flute_size").append('(L)<input id="generate_flute_length_" size="5" type="text" disabled="true" name="generate_flute_length[1][val]">');
                }
                break;
                
            /* Stamping Fieldset */    
            case 4:
                if (checked == true){
                         $('input[id^="stamping_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#stamping_other").val('').attr('disabled', false);
                        $("#quotation_request_form_stamping_per_box").val('').attr('disabled', false);
                        $("#quotation_request_form_stamping_width").val('').attr('disabled', false);
                        $("#quotation_request_form_stamping_length").val('').attr('disabled', false);
                } else {
                        $('input[id^="stamping_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#stamping_other").val('').attr('disabled', true);
                        $("#quotation_request_form_stamping_per_box").val('').attr('disabled', true);
                        $("#quotation_request_form_stamping_width").val('').attr('disabled', true);
                        $("#quotation_request_form_stamping_length").val('').attr('disabled', true);
                }
                break;            
               
            /* Die Cut Fieldset */   
            case 5:
                if (checked == true){
//                        var joint = $("quotation_request_form_lamination_type_joints").val();
//                        alert(joint);
                        
                        $('input[id^="die_cut_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $('input[id^="quotation_request_form_die_cut_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#other_die_cut").val('').attr('disabled', false);
                        $('input[id^="quotation_request_form_window_shape_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#window_shape_other").val('').attr('disabled', false);
//                        $("#mould_no, #window_no").empty();
                        
//                        if (joint < 3){
//                            for(i=0; i < joint; i++){
//                                $("#mould_no").append('<input id="mould_no_" size="10" type="text" name="mould_no[' + i +'][val]">');
//                                $("#window_no").append('<input id="window_no_" size="10" type="text" name="window_no[' + i +'][val]">');
//                            }
//                        }
                } else {
                        $('input[id^="die_cut_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $('input[id^="quotation_request_form_die_cut_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#other_die_cut").val('').attr('disabled', true);
                        $('input[id^="quotation_request_form_window_shape_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#window_shape_other").val('').attr('disabled', true);
//                        $("#mould_no, #window_no").empty();
                }
                break;
                
            /* Window Fieldset */   
            case 6:
                if (checked == true){
                        $('input[id^="quotation_request_form_window_patching_false"]').attr("checked", false).attr("disabled", false);
                        $('input[id^="quotation_request_form_window_patching_true"]').attr("checked", false).attr("disabled", false);
                } else {
                        $('input[id^="quotation_request_form_window_patching_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $('input[id^="quotation_request_form_window_patching_type_plain_film"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#quotation_request_form_pre_print_textbox").val('').attr('disabled', true);
                        $("#other_window_patching").val('').attr('disabled', true);
                        $("#quotation_request_form_window_width").val('').attr('disabled', true);
                        $("#quotation_request_form_window_length").val('').attr('disabled', true);
                        $("#quotation_request_form_window_usage").val('').attr('disabled', true);
                }
                break;
                
            /* Glueing Fieldset */ 
            case 7:
                if (checked == true){
                        $('input[id^="glueing_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#glueing_text").val('').attr('disabled', false);
                        $("#quotation_request_form_glueing_material").val('').attr('disabled', false);
                } else {
                        $('input[id^="glueing_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#glueing_text").val('').attr('disabled', true);
                        $("#quotation_request_form_glueing_material").val('').attr('disabled', true);
                }
                break;
                
            /* Packing Fieldset */ 
            case 8:
                if (checked == true){
                        $('input[id^="quotation_request_form_packing_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#quotation_request_form_packing_type_other").val('').attr('disabled', false);
                        $("#quotation_request_form_packed_quantity").val('0').attr('disabled', false);
                } else {
                        $('input[id^="quotation_request_form_packing_type_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#quotation_request_form_packing_type_other").val('').attr('disabled', true);
                        $("#quotation_request_form_packed_quantity").val('0').attr('disabled', true);
                }
                break;
                
            /* Collating Fieldset */     
            case 11:
                if (checked == true){
                        $('input[id^="quotation_request_form_collect_sequence_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", false);
                        });
                        $("#quotation_request_form_collating_no").val('0').attr('disabled', false);
                        $("#sequent_no").empty();
                } else {
                        $('input[id^="quotation_request_form_collect_sequence_"]').each(function(){
                            $(this).attr("checked", false).attr("disabled", true);
                        });
                        $("#quotation_request_form_collating_no").val('0').attr('disabled', true);
                        $("#sequent_no").empty();
                }
                break;
            
            /* MOQ Fieldset */ 
            case 12:
                if (checked == true){
                        $("#quotation_request_form_no_of_moq").val('').attr('disabled', false);
                        $("#quantity_no").empty();
                        $("#pricing").empty();
                        $("#quotation_request_form_remarks").val('').attr('disabled', false);
                } else {
                        $("#quotation_request_form_no_of_moq").val('').attr('disabled', true);
                        $("#quantity_no").empty();
                        $("#pricing").empty();
                        $("#quotation_request_form_remarks").val('').attr('disabled', true);
                }
                break;
                
            /* Custom Fieldset */ 
            case 13:
                if (checked == true){
                        $("#quotation_request_form_custom_stock_code").val('').attr('disabled', false);
                        $("#quotation_request_form_box_part_no").val('').attr('disabled', false);
                        $("#quotation_request_form_lot_size_no").val('').attr('disabled', false);
                        $("#lot_size").empty();
                } else {
                        $("#quotation_request_form_custom_stock_code").val('').attr('disabled', true);
                        $("#quotation_request_form_box_part_no").val('').attr('disabled', true);
                        $("#quotation_request_form_lot_size_no").val('').attr('disabled', true);
                        $("#lot_size").empty();
                }
                break;
                
                
            default:break;
        }
    });
//================================= QUOTATION REQUEST FORM (END) ===============================================//
    
    $("#run_size").click(function() { 
        var acc_a = acc_b = 0;
        var paper_length_a = paper_length_b = $("#quotation_request_form_paper_length").val();
        var paper_width_a  = paper_width_b = $("#quotation_request_form_paper_width").val();        
        var ra             = $("#quotation_request_form_ratio").val();
        
        if (paper_length_a != 0 && paper_width_a != 0){
            $("#get_size").show();
            $("#calculate_size").html('');
            
            if (paper_width_a <= 200){
                $("#paper_size").css({'width': paper_length_a * 2}).css({'height': paper_width_a * 2});
            } else if (paper_width_a > 200 && paper_width_a <= 400){
                $("#paper_size").css({'width': paper_length_a}).css({'height': paper_width_a});
            } else if (paper_width_a > 400 && paper_width_a <= 800){
                $("#paper_size").css({'width': paper_length_a / 2}).css({'height': paper_width_a / 2});
            } else if (paper_width_a > 800 && paper_width_a <= 1200){
                $("#paper_size").css({'width': paper_length_a / 3}).css({'height': paper_width_a / 3});
            } else if (paper_width_a > 1200 && paper_width_a <= 1600){
                $("#paper_size").css({'width': paper_length_a / 4}).css({'height': paper_width_a / 4});
            } else if (paper_width_a > 1600 && paper_width_a <= 2000){
                $("#paper_size").css({'width': paper_length_a / 5}).css({'height': paper_width_a / 5});
            } else {
                $("#paper_size").css({'width': paper_length_a}).css({'height': paper_width_a});
            }

            //OPTION A
            $("#calculate_size").append('<div><input id="option_size_option_b" type="radio" value="option_b" name="option_size" checked="checked"> OPTION A - (W / Ratio)</div>');

            $("#calculate_size").append('<table>');

            for(var i = ra; 0 < i; i--) {
                if (paper_width_b % i === 0){
                    acc_b = (paper_width_b / i);
                } else {
                    acc_b = parseInt(paper_width_b / i) + 1;
                }

                $("#calculate_size").append(
                  '<tr>' +
                  '<td>' + '(W)' + '</td><td>' + '<input id="printing_width_b_" size="5" value="' + acc_b.toFixed(2) + '" type="text" name="printing_width_b[' + i + '][val]">' + '</td>' +
                  '<td>' + '(L)' + '</td><td>' + '<input id="printing_length_b_" size="5" value="' + paper_length_b + '" type="text" name="printing_length_b[' + i + '][val]">' + '</td>' +
                  '<td align="right">' + 'UPS:' + '</td><td>' + '<input id="printing_no_of_ups_b_" size="5" value="0" type="text" name="printing_no_of_ups_b[' + i + '][val]">' + '</td>' +
                  '</tr>'
                );

                paper_width_b = paper_width_b - acc_b;
            }

            $("#calculate_size").append('<tr><td colspan="4"></td><td>' + 'Total UPS: ' + '</td><td id="auto_total_ups_b">0</td></tr>');
            $("#calculate_size").append('</table>');
            

            //OPTION B
            $("#calculate_size").append('<div><input id="option_size_option_a" type="radio" value="option_a" name="option_size"> OPTION B - (L / Ratio) </div>');

            $("#calculate_size").append('<table>');

            for(var i = ra; 0 < i; i--) {
                if (paper_length_a % i === 0){
                    acc_a = (paper_length_a / i);
                } else {
                    acc_a = parseInt(paper_length_a / i) + 1;
                }

                $("#calculate_size").append(
                  '<tr>' +
                  '<td>' + '(W)' + '</td><td>' + '<input id="printing_width_a_" size="5" value="' + paper_width_a + '" type="text" name="printing_width_a[' + i + '][val]">' + '</td>' +
                  '<td>' + '(L)' + '</td><td>' + '<input id="printing_length_a_" size="5" value="' + acc_a.toFixed(2) + '" type="text" name="printing_length_a[' + i + '][val]">' + '</td>' +
                  '<td align="right">' + 'UPS:' + '</td><td>' + '<input id="printing_no_of_ups_a_" size="5" value="0" type="text" name="printing_no_of_ups_a[' + i + '][val]">' + '</td>' + 
                  '</tr>'
                );

                paper_length_a = paper_length_a - acc_a;
            }

            $("#calculate_size").append('<tr><td colspan="4"></td><td>' + 'Total UPS: ' + '</td><td id="auto_total_ups_a">0</td></tr>');
            $("#calculate_size").append('</table>'); 
        } else {
            alert("Please enter the Paper Size.");
        }

    });

    $("#get_size").click(function() { 
        var option_size = $("input[name='option_size']:checked").val();

        if (option_size == 'option_a' || option_size == 'option_b'){
          compare_printing_width_n_length(option_size);
          ups(option_size);  
        } else {
            alert("Please select the option size in printing size.");
        }
    }); 
    
    $(".click_exists").click(function() { 
        select_exists();
    }); 
    
    $("#show_purchase").click(function(e) { 
        $("#main_qr").hide();
        $("#main_pr").slideDown();
        return false;
    }); 
    
    $("#show_sales").click(function(e) { 
        $("#main_pr").slideUp();
        $("#main_qr").slideDown();
        return false;
    }); 
    
    $("#type_in").click(function(){
        $("#subcon_po_no").hide();
        $("#subcon_r_form").show();
        $("#subcon_qty_po").hide();
        $("#subcon_qty_percent").hide();
        $("#subcon_qty_wo_ream").hide();
        $("#subcon_qty_pallet").hide();
        $("#subcon_qty_out_ream").show();
    });
    
    $("#type_out").click(function(){
        $("#subcon_po_no").show();
        $("#subcon_r_form").hide();
        $("#subcon_qty_po").show();
        $("#subcon_qty_percent").show();
        $("#subcon_qty_wo_ream").show();
        $("#subcon_qty_pallet").show();
        $("#subcon_qty_out_ream").hide();
    });
    
    $("#product_subcon_balance_open").keyup(function(){
        var num = $(this).val();
        $("#product_subcon_balance_current").val(num);
        $("#copy_balance_open").html(num);
    });
    
    $("#subcon_qty_po").keyup(function(){
        var num = $(this).val();
        cal = num / 0.97
        $("#subcon_qty_percent").val(cal.toFixed(2));
    });
    
    $("#adding_contact").click(function(){
        var count = $('#contact_count').html();
        var add_field = parseInt(count) + 1;
        
        add_html = '<tr>'
        add_html += '<td><input id="contact_department_' + add_field + '_val" name="contact_department[' + add_field + '][val]" size="15" type="text" /></td>'
        add_html += '<td><input id="contact_name_' + add_field + '_val" name="contact_name[' + add_field + '][val]" size="15" type="text" /></td>'
        add_html += '<td><input id="contact_email_' + add_field + '_val" name="contact_email[' + add_field + '][val]" size="15" type="text" /></td>'
        add_html += '<td><input id="contact_phone_area_code_' + add_field + '_val" name="contact_phone_area_code[' + add_field + '][val]" size="1" type="text" />-<input id="contact_phone_no_' + add_field + '_val" name="contact_phone_no[' + add_field + '][val]" size="8" type="text" /></td>'
        add_html += '<td><input id="contact_mobile_area_code_' + add_field + '_val" name="contact_mobile_area_code[' + add_field + '][val]" size="1" type="text" />-<input id="contact_mobile_no_' + add_field + '_val" name="contact_mobile_no[' + add_field + '][val]" size="8" type="text" /></td>'
        add_html += '</tr>'
        
        $(".add_contact").append(add_html);
        $('#contact_count').html(add_field);
    });
    
    $("#generate").click(function(){
        var string = $("#product_packing_method").val().toUpperCase();
        var um = $("select#product_unit_measurement_id option:selected").text();
        
        if (string.length > 0 && um.length > 0){
            
            string = string.split("/");
            packing = '<table class="generate_packing_method">'
            $.each(string, function(k, v){
                packing += "<tr><td>"
                packing += '<input id="packing_method_qty_" name="packing_method_qty[' + k + '][val]" size="8" type="text" value="0" /> ' + um + ' per ' + v
                packing += '<input id="packing_method_per_" name="packing_method_per[' + k + '][val]" size="8" type="hidden" value="' + v + '" />'
                packing += "</td></tr>"
                
                um = v
            }); 
            packing += "</table>"
            $("table.generate_packing_method").replaceWith(packing);
            
        } else {
            alert("Please enter Packing Method or select U/M.");
        }
    });
    
    $("#add_bottom_row_for_price_control").click(function(){
        // add new row to table using addTableRow function
        addTableRow_for_price_control($("table.target_table"));
 
        // prevent button redirecting to new page
        return false;
    });
    
    $("#add_bottom_row_for_sales_order").click(function(){
        // add new row to table using addTableRow function
        addTableRow_for_sales_order($("table.target_table"));
 
        // prevent button redirecting to new page
        return false;
    });
    
    $("#add_bottom_row_for_delivery_order").click(function(){
        addTableRow_for_delivery_order($("table.target_table"));
        return false;
    });



    $("#add_bottom_row").click(function(){
        // add new row to table using addTableRow function
        addTableRow($("table.target_table"));
 
        // prevent button redirecting to new page
        return false;
    });
    


});  



$(function() {
        $('input, textarea').placeholder();
    
	$("#menu a").each(function() {
                if (this.href == window.location) {
                        $(this).css("color", "red").css("font-weight", "bold");
                        $(this).parent('li').parent('ul').parent('li').addClass('highlight');
		};
	});
        
        $("#treeview a").each(function() {
                if (this.href == window.location) {
                        $(this).css("color", "blue").css("font-weight", "bold");
		};
	});
        
        $("div#linking a").each(function() {
                if (this.href == window.location) {
                        $(this).css({ 
                            "background-color": "orange",
                            "color": "blue", 
                            "font-weight": "bold", 
                            "border-radius": "8px", 
                            "-moz-border-radius": "8px", 
                            "-webkit-border-radius": "8px",
                            "text-decoration": "none"
                        });
		};
	});
});

function put_product_description(sel){
    var product_id = sel.value;
    $.ajax({
        dataType: "json",
        cache: false,
        url: '/products/' + product_id,
        timeout: 2000,
        success: function(data){ 
            $(".get_desc").html(data.desc);
            $("#data_um").html(data.um);
        }
    });
}

//function change_description(sel){
//    var product_desc = sel.value;
//    $.ajax({
//        dataType: "json",
//        cache: false,
//        url: '/products/look_product_desc?desc=' + product_desc,
//        timeout: 2000,
//        success: function(data){ 
//            if (data){
//                $("#data_um").html(data.um);
//                $(".put_produtct_id").val(data.id.toString()).attr("selected", "selected");
//            } else {
//                alert("Description has unmatched..")
//            }
//        }
//    });
//}



function getCombo_tradecompany_code(sel) {
    var value = sel.options[sel.selectedIndex].value;  

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/trade_companies/' + value,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){                    
            $("#ste_company_name").html(data.name);
         }
    });
}

function getCombo_pr_company(sel) {
//    var title       = parseFloat(sel.options[sel.selectedIndex].title);
//    var qty         = $("#purchase_requisition_item_quantity").val();
//    var total_price = parseInt(qty) * parseFloat(title);
//    $("#data_up").(title.toFixed(4));
//    $("#select_unit_price").val(title.toFixed(4));
//    $("#data_total_price").html(total_price.toFixed(4));
}

function place_customer_id_to_trade_company_id(sel){
    var sel_name = sel.value;
    $("#quotation_request_form_trade_company_id").val('');
    $.ajax({
        dataType: "json",
        cache: false,
        url: '/trade_companies/customer_name_n_place_customer_id?customer_name=' + sel_name,
        timeout: 2000,
        success: function(data){                    
            if (data){
                $("#quotation_request_form_trade_company_id").val(data.id);
            }
         }
    });
}

function getCombo_in_out(sel) {
    var value = sel.options[sel.selectedIndex].value; 
    if (value == "IN"){
        $('.show_in').show();
        $('.show_out').hide();
    } else {
        $('.show_in').hide();
        $('.show_out').show();
    }

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/inventory_issues?type=' + value,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
            $("select#inventory_history_inventory_issue_id").empty();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("select#inventory_history_inventory_issue_id");                        
            $.each(data, function(i, j){
                row = "<option value=\"" + j.id + "\">" + j.description + "</option>";  
                $(row).appendTo("select#inventory_history_inventory_issue_id");                    
            }); 
        }
    });
}

function getCombo_product(sel) {
    var product = sel.options[sel.selectedIndex].value; 
//    alert(product);

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/products/' + product + '/current_stock',
        timeout: 2000,
//        error: function(XMLHttpRequest, errorTextStatus, error){
//            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
//        },
        success: function(data){
            var vhtml = "Current Stock: " + data.current_stock;
            $("#current_product_stock").html(vhtml);
            $("#stock_value").html(data.current_stock);
            $("#stock_out_um").html(data.um);
            $("#stock_out_unit_measurement_id").val(data.unit_measurement_id);
            $("#stock_out_description").html(data.desc);

            if (data.current_stock == 0){
                alert("Current stock has not available now.")   
                $("#stock_out_save_button").hide();
            }
        }
    });
}

function fg_product(sel) {
    var product = sel.options[sel.selectedIndex].value; //16
    var company = $("#sales_order_item_trade_company_id").val(); //11
    
    if (product){
        $.ajax({
            dataType: "json",
            cache: false,
            url: "/product_customers/matching_product_customer",
            data: {product_id : product, company_id : company},
            timeout: 2000,
            success: function(response){
                if (response){
                    $.each(response, function(i, j){
                        if (j.match == true){
                            $("#display_um").html(j.unit_measurement_code);
                            $("#sales_order_item_unit_measurement_id").val(j.unit_measurement_id);

                            $("#display_desc").html(j.description);
                            $("#sales_order_item_description").val(j.description);

                            var flo = parseFloat(j.selling_price).toFixed(4);
                            $("#display_sp").html(flo);
                            $("#sales_order_item_unit_price").val(flo);

                            $("#display_current_stock").html(j.current_stock);
                            $("#sales_order_item_current_stock").val(j.current_stock);
                        } else {
                             alert("No Price, Please refer to Marketing Department.");
                        }
                    }); 
                }
            }
        });
    }
}

function product_subcon(sel) {
    var product = sel.options[sel.selectedIndex].value; 

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/products/' + product,
        timeout: 2000,
        success: function(data){
            var vhtml = "Subcon Size: " + data.subcon_size + "<br/> Subcon Box Size: " + data.subcon_box_size;
            $("#subcon_details").html(vhtml);
            $("#subcon_bal_iss_ream").val(data.subcon_balance_current);
            $("#bal_ream").html(data.subcon_balance_current);
        }
    });
}

function getCombo_ste(sel) {
    var ste = sel.options[sel.selectedIndex].value; 
    link = '/sales_tax_exemptions/' + ste;
    
    $.get(link,
       function(data){
           var vhtml="";
           vhtml += "Expire Date: ";
           vhtml += data.period_end;
           $("#expire_date").html(vhtml);
    }, "json");
}
    
function combo_purchase_order(sel){
    var value = sel.options[sel.selectedIndex].value; 
    if (value == 1){
        $('#text_title_box').show();
        
    }
}

function getcombo_perihal_barang(sel) {
    var ste = sel.options[sel.selectedIndex].value; 
    link = '/sales_tax_exemptions/' + ste;
    
    $.get(link, function(data){
           var vhtml = data.perihal_barang;
           $("#show_barang").html(vhtml);
    }, "json");
}

////////////////// QUOTATION  ///////////////////////////

function dropdown_colorcode(sel) {
    var code = sel.value;
    if (code <= 10){
        $("#color_name, #color_code").empty();
        for(var i = 1; i <= code; i++) {
            $("#color_name").append('<input id="color_name_" type="text" size="8" name="color_name[' + i + '][val]">');
            $("#color_code").append('<input id="color_code_" type="text" size="8" name="color_code[' + i + '][val]">');
        }
    } else {
        alert("No of color should less than or equal to 10.");
    }
}

function dropdown_sequent(sel) {
//    var seq = sel.options[sel.selectedIndex].value; 
    var seq = sel.value;
    if (seq <= 6){
        $("#sequent_no").empty();

        for(var i = 1; i <= seq; i++) {
            $("#sequent_no").append('' + i + '/' + seq + '<input id="sequent_" size="8" type="text" name="sequent[]">');
        }
    } else {
        alert("No of Design should less than or equal to 6.");
    }
}

function dropdown_moq(sel) {
//    var seq = sel.options[sel.selectedIndex].value; 
    var seq = sel.value;
    if (seq <= 10){
        $("#quantity_no").empty();
        $("#pricing").empty();

        for(var i = 1; i <= seq; i++) {
            $("#quantity_no").append('<input id="qty_" size="8" type="text" name="quantity[' + i + '][qty]">');
        }

        for(var i = 1; i <= seq; i++) {
            $("#pricing").append('<input id="pricing_" size="8" type="text" name="pricing[' + i + '][price]">');
        }
    } else {
        alert("No of MOQ should be less than or equal to 10.");
    }
}

function dropdown_lotsize(sel) {
    var seq = sel.value;
    if (seq <= 10){
        if (seq != ''){
            $("#lot_size").empty();

            $("#lot_size").append('<table>');
            $("#lot_size").append('<tr><th>Size</th><th>Part/Art No.</th><th>Cat/Reorder No.</th><th>Customer Stock Code</th></tr>');
            for(var i = 1; i <= seq; i++) {
                $("#lot_size").append('<tr>');
                $("#lot_size").append('<td><input id="lot_size_" size="3" type="text" name="lot_size[' + i + '][size]"></td>');
                $("#lot_size").append('<td><input id="part_no_" type="text" name="part_no[' + i + '][part]"></td>');
                $("#lot_size").append('<td><input id="category_no_" type="text" name="category_no[' + i + '][category]"></td>');
                $("#lot_size").append('<td><input id="stock_ref_" size="40" type="text" name="stock_ref[' + i + '][ref]"></td>');
                $("#lot_size").append('</tr>');
            }
            $("#lot_size").append('</table>');
        } else {
            $("#lot_size").empty();
        }
    } else {
        alert("No of Size should be less than or equal to 10.");
    }
}

function generate_stamping_box(sel) {
    var box_no = sel.value;
    if (box_no <= 4){
        if (box_no != ''){
            $("#generate_stamping_size").empty();
            for(var i = 1; i <= box_no; i++) {
                $("#generate_stamping_size").append('(W)<input id="stamping_width_" size="5" type="text" name="stamping_width[' + i + '][val]">');
                $("#generate_stamping_size").append('(L)<input id="stamping_length_" size="5" type="text" name="stamping_length[' + i + '][val]"><br/>');
            }
        } else {
            $("#generate_stamping_size").empty();
        }
    } else {
        alert("No of Location Per Box should be less than or equal to 4.");
    }
}



function dropdown_report_to(sel) {
    var level = sel.options[sel.selectedIndex].value; 
    var incremet_level = parseInt(level) + 1;

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/users/lookup_level?lvl=' + incremet_level,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
            $("select#report_to").empty();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("report_to");
            
            if (level === '3'){
                var director = "<option value=\"" + "1" + "\">" + "DIRECTOR" + "</option>";
                $(director).appendTo("select#report_to");
            } 
            else {
                $.each(data, function(i, j){
                    row = "<option value=\"" + j.id + "\">" + j.name + "</option>";  
                    $(row).appendTo("select#report_to");                    
                }); 
            }
        }
    });
}



function ups(os){
        if (os == 'option_b'){
                var sum_ups_b = 0;
                $('input[id^="printing_no_of_ups_b_"]').each(function() {
                        if(!isNaN(this.value) && this.value.length!=0) {
                            sum_ups_b += parseInt(this.value);
                        }                    
                })
                $("#auto_total_ups_b").html(sum_ups_b);
        } 
        else if (os == 'option_a') {
                var sum_ups_a = 0;
                $('input[id^="printing_no_of_ups_a_"]').each(function() {
                        if(!isNaN(this.value) && this.value.length!=0) {
                            sum_ups_a += parseInt(this.value);
                        }                    
                })
                $("#auto_total_ups_a").html(sum_ups_a);
        } 
}

function compare_printing_width_n_length(os){
    if (os == 'option_b'){
            var sum_width_b = 0;
            $('input[id^="printing_width_b_"]').each(function() {
                    if(!isNaN(this.value) && this.value.length!=0) {
                        sum_width_b += parseInt(this.value);
                    }                    
            })
            
            if ($("#quotation_request_form_paper_width").val() >= sum_width_b.toFixed(2) ){
//                alert("OPTION A PASS.");
            } else {
                alert("OPTION A FAIL.");
            }
    } else if (os == 'option_a') {
            var sum_length_a = 0;
            $('input[id^="printing_length_a_"]').each(function() {
                    if(!isNaN(this.value) && this.value.length!=0) {
                        sum_length_a += parseInt(this.value);
                    }                    
            })

            if ($("#quotation_request_form_paper_length").val() >= sum_length_a.toFixed(2) ){
//                alert("OPTION B PASS.");
            } else {
                alert("OPTION B FAIL.");
            }
    }
}

function loading_flute(){
    $("#quotation_request_form_lamination_type_opp_gloss").attr("checked", false);
    $("#quotation_request_form_lamination_type_opp_matt").attr("checked", false);
    
    $("#quotation_request_form_flute_type_b-flute").attr("disabled", false);
    $("#quotation_request_form_flute_type_e-flute").attr("disabled", false);
    $("#quotation_request_form_flute_type_others").attr("disabled", false);
    $("#quotation_request_form_flute_type_other").attr("disabled", false);
    $("#quotation_request_form_flute_material_2626").attr("disabled", false);
    $("#quotation_request_form_flute_material_2633").attr("disabled", false);
    $("#quotation_request_form_flute_material_3333").attr("disabled", false);
    $("#quotation_request_form_flute_material_others").attr("disabled", false);
    $("#quotation_request_form_flute_material_other").attr("disabled", false);
    $("#generate_flute_size").empty();
    $("#generate_flute_size").append('(W)<input id="generate_flute_width_" size="5" type="text" name="generate_flute_width[1][val]">');
    $("#generate_flute_size").append('(L)<input id="generate_flute_length_" size="5" type="text" name="generate_flute_length[1][val]">');

}

function disabled_flute(){
    $("#quotation_request_form_flute_type_b-flute").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_type_e-flute").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_type_others").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_type_other, #quotation_request_form_flute_material_other").val('').attr("disabled", true);
    $("#quotation_request_form_flute_material_2626").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_material_2633").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_material_3333").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_material_others").attr("checked", false).attr("disabled", true);
    $("#quotation_request_form_flute_material_other").attr("checked", false).attr("disabled", true);
    $("#generate_flute_size").empty();
    $("#generate_flute_size").append('(W)<input id="generate_flute_width_" size="5" type="text" disabled="true" name="generate_flute_width[1][val]">');
    $("#generate_flute_size").append('(L)<input id="generate_flute_length_" size="5" type="text" disabled="true" name="generate_flute_length[1][val]">');
}

function select_exists() {
    $.ajax({
        dataType: "json",
        cache: false,
        url: '/trade_companies/active_customer',
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
            $("#select_customer").empty();
            
            $("#select_customer").append('<select id="sales_order_trade_company_id" name="sales_order[trade_company_id]">');
            $("select#sales_order_trade_company_id").append('<option value=""></option>');
            $.each(data, function(i, j){
                row = "<option value=\"" + j.id + "\">" + j.name + "</option>"
                $("select#sales_order_trade_company_id").append(row);
            }); 
            $("#select_customer").append('</select>');
            $("#sales_order_trade_company_id").kendoComboBox({filter: "contains"});
        }
    });
}

function select_qr(sel) {
    var qr = sel.value; 

    $.ajax({
        dataType: "json",
        cache: false,
        url: '/quotation_request_forms/' + qr,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
            alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
            $("#customer_name").val(data.customer_name);
            $("#product_desc").val(data.description);
            $("#quotation_customer").html(data.customer_name);
        }
    });
}

function sales_order_company_change(sel){
    var company_id = sel.value;
    if (company_id){
        $.ajax({
            dataType: "json",
            cache: false,
            url: '/trade_companies/' + company_id ,
            timeout: 2000,
            success: function(data){
                if (data.trade_term_id != null){
                    var term = data.trade_term_id
                    $("select#sales_order_trade_term_id option").each(function(){
                        if($(this).val() == term){
                            $(this).attr("selected","selected");
                            return false;
                        }
                    });
                }
            }
        });
    }
}

function allow_mail(row_id, html_mail){
    $.ajax({
        dataType: "json",
        cache: false,
        url: '/quotation_request_forms/' + row_id,
        timeout: 2000,
        success: function(data){
            if (data.director_approved == true){
                if (data.status == "A"){ 
                    $("#on_mail").html(html_mail); 
                }
            }
        }
    });
}

function price_control_add(id){
    var company = id.value;
    if(company != 0){
        link = "/price_control_items/new?company_id=" + company;
        add_button = "<a class='iframe_1600x900' data-fancybox-type='iframe' href=" + link + "><img class='cube35' title='Add New Product Price Control Item' src='/assets/add_item_button.png' alt='Add New Product Price Control Item'></a>"
    } else{
        add_button = "<span id='add_item'><img alt='Add Items' class='opac_icon' src='/assets/add_item_button.png' title='Add Items' /></span>";
    }
    $("#add_item").html(add_button);
}

function price_control_data(sel) {
    var number = sel.name.match(/\[(\d+)\]/);
    var number = parseInt(number[1], 10);
    var product_id = sel.options[sel.selectedIndex].value; ;
    var company_id = $("select.price_control_trade_company_id option:selected").val();
    
    if (company_id){
        $.ajax({
            type: "GET",
            dataType: "json",
            cache: false,
            url: '/price_controls/take_old_unit_price_and_eff_date',
            data: { 'company_id' : company_id, 'product_id' : product_id },
            success: function(data){ 
                
                var myDate = Date.parse(data.eff_date, "yyyy-MM-dd");
                var sellPrice = data.selling_price;
                
                if (myDate){
                    var k_date = myDate.getDate() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getFullYear();
                    value_date = '#datarow_' + number + '_old_eff_date';
                    html_date  = '#old_date_' + number;
                    $(value_date).val(k_date);
                    $(html_date).html(k_date);
                } else {
                    $(value_date).val(' ');
                    $(html_date).html('-');
                }
                
                if (sellPrice){
                    var f_num = parseFloat(sellPrice).toFixed(4);  
                    value_sellPrice = '#datarow_' + number + '_old_unit_price';
                    html_sellPrice  = '#old_up_' + number;
                    $(value_sellPrice).val(f_num);
                    $(html_sellPrice).html(f_num);
                } else {
                    $(value_sellPrice).val(' ');
                    $(html_sellPrice).html('-');
                }
                
            }
        });
    } else {
        alert("Trade Company can't blank.");
    }
}

function product_customer_data(sel){
    var number = sel.name.match(/\[(\d+)\]/);
    var number = parseInt(number[1], 10);
    var product_id = sel.options[sel.selectedIndex].value; ;
    var company_id = $("select.sales_order_trade_company_id option:selected").val();
    
    if (company_id.length > 0){
        $.ajax({
            type: "GET",
            dataType: "json",
            cache: false,
            url: '/product_customers/take_data',
            data: { 'company_id' : company_id, 'product_id' : product_id },
            success: function(data){ 
                
                var sellPrice = data.selling_price;
                
                if (sellPrice){
                    var f_num = parseFloat(sellPrice).toFixed(4);
                    value_sellPrice = '#datarow_' + number + '_unit_price';
                    html_sellPrice  = '#unit_price_' + number;
                    $(value_sellPrice).val(f_num);
                    $(html_sellPrice).html(f_num);
                } else {
                    alert("Unit Price is not found.");
                    $(value_sellPrice).val(' ');
                    $(html_sellPrice).html('-');
                }
                
            }
        });
    } else {
        alert("Customer Company can't blank.");
    }
}

function addTableRow(table)
{
    var $tr = $(table).find("tbody tr:last").clone(false);
    
    datarow_id_and_name($tr);
    
    $(table).find("tbody tr:last").after($tr);
};

function datarow_id_and_name(tr){
    tr.find('[name^=datarow]').attr('name', function() {
        var index = this.name.match(/\[(\d+)\]/);
        if (index != null && index.length > 1) {
            var newIndex = parseInt(index[1], 10) + 1;
            return this.name.replace(/\[(\d+)\]/, '[' + newIndex + ']');
        }
        return this.name;    
    });
    
    tr.find('[name^=datarow]').attr('id', function() {
        var index_two = this.id.match(/\_(\d+)\_/);
        if (index_two != null && index_two.length > 1) {
            var newIndex = parseInt(index_two[1], 10) + 1;
            return this.id.replace(/\_(\d+)\_/, '_' + newIndex + '_');
        }
        return this.id;    
    });
}

function addTableRow_for_price_control(table){
    var $tr = $(table).find("tbody tr:last").clone(false);
    
    datarow_id_and_name($tr);
    
    $tr.find('[id^=old_date]').attr('id', function() {
        var index_three = this.id.match(/\_(\d+)/);
        if (index_three != null && index_three.length > 1) {
            var newIndex = parseInt(index_three[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $tr.find('[id^=old_up]').attr('id', function() {
        var index_four = this.id.match(/\_(\d+)/);
        if (index_four != null && index_four.length > 1) {
            var newIndex = parseInt(index_four[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $(table).find("tbody tr:last").after($tr);
};

function addTableRow_for_sales_order(table)
{
    var $tr = $(table).find("tbody tr:last").clone(false);
    
    datarow_id_and_name($tr);
    
    $tr.find('[id^=unit_price]').attr('id', function() {
        var index_three = this.id.match(/\_(\d+)/);
        if (index_three != null && index_three.length > 1) {
            var newIndex = parseInt(index_three[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $(table).find("tbody tr:last").after($tr);
};

function addTableRow_for_delivery_order(table)
{
    var $tr = $(table).find("tbody tr:last").clone(false);
    
    datarow_id_and_name($tr);
    
    $tr.find('[id^=so_date]').attr('id', function() {
        var index_three = this.id.match(/\_(\d+)/);
        if (index_three != null && index_three.length > 1) {
            var newIndex = parseInt(index_three[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $tr.find('[id^=so_order_qty]').attr('id', function() {
        var index_four = this.id.match(/\_(\d+)/);
        if (index_four != null && index_four.length > 1) {
            var newIndex = parseInt(index_four[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $tr.find('[id^=so_balance_qty]').attr('id', function() {
        var index_five = this.id.match(/\_(\d+)/);
        if (index_five != null && index_five.length > 1) {
            var newIndex = parseInt(index_five[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $tr.find('[id^=so_status]').attr('id', function() {
        var index_six = this.id.match(/\_(\d+)/);
        if (index_six != null && index_six.length > 1) {
            var newIndex = parseInt(index_six[1], 10) + 1;
            return this.id.replace(/\_(\d+)/, '_' + newIndex);
        }
        return this.id;    
    });
    
    $(table).find("tbody tr:last").after($tr);
};

$('#checkall:checkbox').change(function () {
    if($(this).attr("checked")) $('input:checkbox').attr('checked','checked');
    else $('input:checkbox').removeAttr('checked');
});
