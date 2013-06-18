$(document).ready(function() {
    
    $("#k_menu").kendoMenu({openOnClick: true});
              
    $(".maskDate").keydown(function(e){
        if ($(this).val().length <= 10){
            
            var key = e.which || e.keyCode;

            if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
                // numbers   
                key >= 48 && key <= 57 ||
                // Numeric keypad
                key >= 96 && key <= 105 ||
                // comma, period and minus, . on keypad      '
                key == 190 || key == 188 || key == 109 || key == 110 || key == 222 ||
                // Backspace and Tab and Enter
                key == 8 || key == 9 || key == 13 ||
                // Home and End
                key == 35 || key == 36 ||
                // left and right arrows
                key == 37 || key == 39 ||
                // Del and Ins
                key == 46 || key == 45) {
                  if (e.keyCode != 8) {
                        if      ($(this).val().length == 2){ return $(this).val($(this).val() + "-"); }
                        else if ($(this).val().length == 5){ return $(this).val($(this).val() + "-"); } 
                  }
            } else {
                return false;
            }
        } else {
            $(this).val($.trim($(this).val()).slice(0, -1));
        }
    }); 
    
//    $(".digg_pagination").append('<i style="color: red;">*pg</i>');
      
    $('#checkall:checkbox').change(function () {
        if($(this).attr("checked")) $('input:checkbox').attr('checked','checked');
        else $('input:checkbox').removeAttr('checked');
    });	
    
    $("table.target_table").on('click','.remove_datarow',function(event){
        event.preventDefault();
        if ($(this).parents('table').find('tr').length > 2) { 
            $(this).closest('tr').remove();
        }else{
            alert ('Must have at least one row!')
        }
    });
    
    $("#k_tabStrip, #product_tabStrip, #purchase_order_tabStrip, #user_strip, #company_strip, #qr_strip").kendoTabStrip({animation: {open: {effects: "fadeIn"}}});
    $("#panelbar").kendoPanelBar({expandMode: "single"});

    $('input[class^="mkendo_date"]').kendoDatePicker({format: "dd-MM-yyyy"});
    
    $(".mkendo_combobox").kendoComboBox({filter: "contains"});
    
    $(".kendo_precision_6").kendoNumericTextBox({min: 0, decimals: 6, format: "n6"});
    $(".kendo_precision_4").kendoNumericTextBox({min: 0, decimals: 4, format: "n4"});
    $(".kendo_precision_2").kendoNumericTextBox({min: 0, decimals: 2, format: "n2"});
    $(".kendo_precision_0").kendoNumericTextBox({min: 0, decimals: 0, format: "n0"});
    
    $('#j_tabify').tabify();
        
    $('#j_tabify').click(function(){
        setTimeout(function(){
          if (location.hash == "#tabify_listing-tab"){
            $(".left_icon_tag").show();
            $(".center_icon_tag").show();
            $(".icon_tag").show();            
          } else if (location.hash == "#tabify_search-tab"){
            $(".left_icon_tag").hide();
            $(".center_icon_tag").hide();
            $(".icon_tag").hide();
          }            
        },100);
    });
    
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
        a = parseFloat($(this).val());
        b = a / 100;
        c = parseFloat($(".po_subtotal").attr("title"));
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
                                             

    
    $("#quotation_request_form_quantity, #quotation_request_form_unit_price").keyup(function(){
        var quotation_qty         = $("#quotation_request_form_quantity").val();
        var unit_price            = $("#quotation_request_form_unit_price").val();
        var total_price = parseInt(quotation_qty) * parseFloat(unit_price);
        $("#total_quotation").html(total_price.toFixed(4));
    });
    
    $("#sales_order_item_quantity").keyup(function(){
        var qty           = $(this).val();
        var selling_price = $("#display_sp").html();
        amount_price      = parseInt(qty) * parseFloat(selling_price);
        $(".amount_price").html(amount_price.toFixed(2));
    });
    

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
            var add_class                   = $("#on_add_customer, #on_add_product").attr("addClass");
            var show_class                  = $("#on_show, #on_show_kiv, #on_history").attr("showClass");
            var edit_class                  = $("#on_edit").attr("editClass");
            var apply_class                 = $("#on_apply, #on_add_product_id").attr("applyClass");
            var apply_vendor_select_class   = $("#on_apply_vendor_select").attr("applyClass");
            var apply_proposed_vendor_class = $("#on_apply_proposed_vendor").attr("applyClass");
            var apply_vendor_reg_class      = $("#on_apply_vendor_reg").attr("applyClass");
            var apply_make_po_class         = $("#on_apply_make_po").attr("applyClass");
            var cost_class                  = $("#on_cost").attr("costClass");
            
            var link_show      = "/" + controller_Name + "/" + row_id;
            var link_edit      = "/" + controller_Name + "/" + row_id + "/edit";
            var link_kiv       = "/" + controller_Name + "/" + row_id;         
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
            var link_costing = "/costing_sheets?id=" + row_id;
            var link_add_product_id = "/products/message?pri_id=" + row_id;
            var link_history    = "/price_control_items?id=" + row_id;
            var link_quotation = "/job_sheets/new?id=" + row_id;
            var link_active_so = "/boms/new?id=" + row_id;

            html_show = "<a class='k-button " + show_class + "'  data-fancybox-type='iframe' href=" + link_show  + "><b>Show</b></a>"
            html_edit = "<a class='k-button " + edit_class + "' data-fancybox-type='iframe' href=" + link_edit + "><b>Edit</b></a>"
            html_kiv = "<a rel='nofollow' class='k-button' data-method='delete' data-confirm='Are you sure move to KIV?' href=" + link_kiv + "><b>Drop to KIV</b></a>"
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
            // html_make_po = "<a class='k-button " + apply_make_po_class + "' data-fancybox-type='iframe' href=" + link_apply_make_po + "><b>Open</b></a>"
            html_make_po = "<a class='k-button' href=" + link_apply_make_po + "><b>Open</b></a>"
            html_printable_po = "<a target='_blank' class='k-button' href=" + link_printable_po + "><b>Printer</b></a>"
            html_ste_show_history = "<a class='show_without_refresh_page_1600x900 k-button' data-fancybox-type='iframe' href=" + link_show_history + "><b>Show Histories for Suppliers</b></a>"
            html_mail = "<a class='iframe_800x450 k-button' data-fancybox-type='iframe' href=" + link_mail + "><b>Mail</b></a>"
            html_add_customer = "<a class='k-button " + add_class + "' data-fancybox-type='iframe' href=" + link_add_customer + "><b>Add New Customer</b></a>"
            html_add_product = "<a class='k-button " + add_class + "' data-fancybox-type='iframe' href=" + link_add_product + "><b>Add New Product</b></a>"
            html_costing = "<a class='k-button " + cost_class + "' data-fancybox-type='iframe' href=" + link_costing + "><b>Costing Sheet</b></a>"
            html_add_product_id = "<a class='k-button " + apply_class + "' data-fancybox-type='iframe' href=" + link_add_product_id + "><b>Apply the Product ID Registration</b></a>"
            html_history = "<a class='k-button " + show_class + "'  data-fancybox-type='iframe' href=" + link_history  + "><b>History</b></a>"
            html_quotation = "<a class='k-button' href=" + link_quotation  + "><b>Open</b></a>"
            html_active_so = "<a class='k-button' href=" + link_active_so  + "><b>Open</b></a>"
            
            $("#on_show").html(html_show);
            $("#on_edit").html(html_edit);
            $("#on_kiv").html(html_kiv);
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
            $("#on_history").html(html_history);
            $("#on_confirmed_quotation").html(html_quotation);
            $("#on_active_so").html(html_active_so);
        };
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
                packing += '<input id="packing_method_qty_" name="packing_method_qty[' + k + '][val]" type="text" value="0" class="k-textbox" style="width:80px;" /> ' + um + ' per ' + v
                packing += '<input id="packing_method_per_" name="packing_method_per[' + k + '][val]" type="hidden" value="' + v + '" />'
                packing += "</td></tr>"
                um = v
            }); 
            packing += "</table>"
            $("table.generate_packing_method").replaceWith(packing);
            
        } else {
            alert("Please enter Packing Method or select U/M.");
        }
    });
    
    $("#add_row_button").click(function(){
       addTableRow($("table.target_table"));
       return false; 
    });
   
});  

$(function() {
        $('input, textarea').placeholder();
    
	$("#k_menu a").each(function() {
                if (this.href == window.location) {
                        $(this).css("color", "brown").css("font-weight", "bold");
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
        
        if (location.hash == "#tabify_listing-tab"){
            $(".left_icon_tag").show();
            $(".center_icon_tag").show();
            $(".icon_tag").show();
        } else if (location.hash == "#tabify_search-tab"){
            $(".left_icon_tag").hide();
            $(".center_icon_tag").hide();
            $(".icon_tag").hide();
        } 
});



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

// QUOTATION (Start)

function dropdown_lotsize(sel) {
    var seq = sel.value;
    if (seq <= 10){
        if (seq != ''){
            $("#lot_size").empty();
            $("#lot_size").append('<table>');
            $("#lot_size").append('<tr><th>Size</th><th>Part/Art No.</th><th>Cat/Reorder No.</th><th>Customer Stock Code</th></tr>');
            for(var i = 1; i <= seq; i++) {
                $("#lot_size").append('<tr>');
                $("#lot_size").append('<td><input id="lot_size_" class="k-textbox" type="text" name="lot_size[' + i + '][size]"></td>');
                $("#lot_size").append('<td><input id="part_no_" class="k-textbox" type="text" name="part_no[' + i + '][part]"></td>');
                $("#lot_size").append('<td><input id="category_no_" class="k-textbox" type="text" name="category_no[' + i + '][category]"></td>');
                $("#lot_size").append('<td><input id="stock_ref_" class="k-textbox" type="text" name="stock_ref[' + i + '][ref]"></td>');
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

function dropdown_colorcode(sel) {
    var code = sel.value;
    if (code <= 10){
        $("#color_name, #color_code").empty();
        for(var i = 1; i <= code; i++) {
            $("#color_name").append('<input id="color_name_" type="text" style="width: 80px;" class="k-textbox" name="color_name[' + i + '][val]">');
            $("#color_code").append('<input id="color_code_" type="text" style="width: 80px;" class="k-textbox" name="color_code[' + i + '][val]">');
        }
    } else {
        alert("No of color should less than or equal to 10.");
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
    $("#generate_flute_size").append('(W) <input id="generate_flute_width_" style="width:80px;" class="lamination_precision_2" type="text" name="generate_flute_width[1][val]">');
    $("#generate_flute_size").append('(L) <input id="generate_flute_length_" style="width:80px;" class="lamination_precision_2" type="text" name="generate_flute_length[1][val]">');
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
    $("#generate_flute_size").append('(W) <input id="generate_flute_width_" style="width:80px;" class="lamination_precision_2" type="text" disabled="true" name="generate_flute_width[1][val]">');
    $("#generate_flute_size").append('(L) <input id="generate_flute_length_" style="width:80px;" class="lamination_precision_2" type="text" disabled="true" name="generate_flute_length[1][val]">');
    $("#mould_no, #window_no").empty();
    $("#mould_no").append('<input class="mould_no_ k-textbox" type="text" name="mould_no[1][val]" disabled="disabled">');
    $("#window_no").append('<input class="window_no_ k-textbox" type="text" name="window_no[1][val]" disabled="disabled">');
}

function generate_stamping_box(sel) {
    var box_no = sel.value;
    if (box_no <= 4){
        if (box_no != ''){
            $("#generate_stamping_size").empty();
            for(var i = 1; i <= box_no; i++) {
                $("#generate_stamping_size").append('(W) <input id="stamping_width_" class="stamping_precision_2" style="width:80px;" type="text" name="stamping_width[' + i + '][val]">');
                $("#generate_stamping_size").append('(L) <input id="stamping_length_" class="stamping_precision_2" style="width:80px;" type="text" name="stamping_length[' + i + '][val]"><br/>');
            }
            $(".stamping_precision_2").kendoNumericTextBox({min: 0, decimals: 2, format: "n2"}); 
        } else {
            $("#generate_stamping_size").empty();
        }
    } else {
        alert("No of Location Per Box should be less than or equal to 4.");
    }
}

function dropdown_sequent(sel) {
    var seq = sel.value;
    if (seq <= 6){
        $("#sequent_no").empty();
        for(var i = 1; i <= seq; i++) {
            $("#sequent_no").append('' + i + '/' + seq + '<input id="sequent_" class="k-textbox" style="width:80px;" type="text" name="sequent[]">');
        }
    } else {
        alert("No of Design should less than or equal to 6.");
    }
}

function dropdown_moq(sel) {
    var seq = sel.value;
    if (seq <= 10){
        $("#quantity_no").empty();
        $("#pricing").empty();

        for(var i = 1; i <= seq; i++) {
            $("#quantity_no").append('<input id="qty_" class="moq_precision_0" style="width: 80px;", type="text" name="quantity[' + i + '][qty]">');
        }

        for(var i = 1; i <= seq; i++) {
            $("#pricing").append('<input id="pricing_" class="moq_precision_4" style="width: 80px;" type="text" name="pricing[' + i + '][price]">');
        }
        $(".moq_precision_0").kendoNumericTextBox({min: 0, decimals: 0, format: "n0"}); 
        $(".moq_precision_4").kendoNumericTextBox({min: 0, decimals: 4, format: "n4"});
    } else {
        alert("No of MOQ should be less than or equal to 10.");
    }
}

// QUOTATION (End)






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
            var origin = parseFloat($("#quotation_request_form_paper_width").val());
            var sum_width_b = 0;
            $('input[id^="printing_width_b_"]').each(function() {
                if(!isNaN(this.value) && this.value.length!=0) {sum_width_b += parseInt(this.value);}                    
            })
            
            if (origin.toFixed(2) >= sum_width_b.toFixed(2) ){
                alert("OPTION A PASS.");
            } else {
                alert("OPTION A FAIL.");
            }
    } else if (os == 'option_a') {
            var origin = parseFloat($("#quotation_request_form_paper_length").val());
            var sum_length_a = 0;
            $('input[id^="printing_length_a_"]').each(function() {
                if(!isNaN(this.value) && this.value.length!=0) {sum_length_a += parseInt(this.value);}                    
            })

            if ( origin.toFixed(2) >= sum_length_a.toFixed(2) ){
                alert("OPTION B PASS.");
            } else {
                alert("OPTION B FAIL.");
            }
    }
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
            url: '/trade_companies/' + company_id,
            timeout: 2000,
            success: function(data){
                if (data.trade_term_id != null){                            
                    var combobox = $("#sales_order_trade_term_id").data("kendoComboBox");
                    combobox.value(data.trade_term_id);
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



function access_pp_no(sel) {
    $('*').css('cursor','wait');
    var company_id = sel.options[sel.selectedIndex].value;
    
    if (company_id){
        $.ajax({
            type: "GET",
            dataType: "json",
            cache: false,
            url: '/trade_companies/' + company_id,
            success: function(data){
                var current = $("#current_pp_no").val();
                var combine = data.code + '-' + current;
                $("#generate_pp_no").html(combine);
                $("#price_control_pp_no").val(combine);
                $('*').css('cursor','auto');
            },
            error: function(){
                $('*').css('cursor','auto');
            }
        });
    }
}

function addTableRow(table){
//    var tr_length = $(table).find("tbody tr").length;
//    if (tr_length <= 4){
        var $tr = $(table).find("tbody tr:last").clone(true);
        datarow_all_attributes($tr);
        $(table).find("tbody tr:last").after($tr);
        running_kendoui();
//    } else {
//        alert("Must be limit to 5 items.");
//    }
}

function datarow_all_attributes(tr){

    tr.find('[name^=datarow]').each(function(k, elem) {
        var str_id = $(this).attr('id');
        if (typeof str_id != 'undefined'){
            var index_one = str_id.match(/\_(\d+)\_/);
            if (index_one != null && index_one.length > 1) {
                var new_index_one = parseInt(index_one[1], 10) + 1;
                var raise = str_id.replace(/\_(\d+)\_/g, '_' + new_index_one + '_');
                $(this).attr('id', raise);
                $(this).val('');
            }
        }
    });
    
    tr.find('[name^=datarow]').each(function(k, elem) {
        var str_name = $(this).attr('name');
        if (typeof str_name != 'undefined'){
            var index_two = str_name.match(/\[(\d+)\]/);
            if (index_two != null && index_two.length > 1) {
                var new_index_two = parseInt(index_two[1], 10) + 1;
                var raise = str_name.replace(/\[(\d+)\]/g, '[' + new_index_two + ']');
                $(this).attr('name', raise);
            }
        }
    });
    
    tr.find('[class^=k-invalid-msg]').each(function(k, elem) {
        var dataFor = $(this).attr('data-for');
        if (typeof dataFor != 'undefined'){
            var index_five = dataFor.match(/\[(\d+)\]/);
            if (index_five != null && index_five.length > 1) {
                var new_index_five = parseInt(index_five[1], 10) + 1;
                var raise = dataFor.replace(/\[(\d+)\]/g, '[' + new_index_five + ']');
                $(this).attr('data-for', raise);
            }
        }
    });
    
    // Price Control
    string_last_number(tr, '[id^=old_up]');
    string_last_number(tr, '[id^=old_date]');

    // Sales Order, Unit Price will join with Delivery Order
    string_last_number(tr, '[id^=um_code]');    // for sales order and sales tax exemption
    string_last_number(tr, '[id^=partCode]');
    string_last_number(tr, '[id^=lotNo]');

    // Delivery Order     cur_stock_0
    string_last_number(tr, '[id^=so_date]');
    string_last_number(tr, '[id^=so_order_qty]');
    string_last_number(tr, '[id^=unit_price]');
    string_last_number(tr, '[id^=so_balance_qty]');
    string_last_number(tr, '[id^=partno]');
    string_last_number(tr, '[id^=clientLotNo]');
    string_last_number(tr, '[id^=clientPoNo]');
    string_last_number(tr, '[id^=do_status]');
    string_last_number(tr, '[id^=cur_stock]');
    string_last_number(tr, '[id^=ori_cur_stock]');
    
    // balance amount
    string_last_number(tr, '[id^=bal_amount]');
    string_last_number(tr, '[id^=doc_amount]');
    string_last_number(tr, '[id^=os_amount]');
    
}

function string_last_number(tr, last_number){
    tr.find(last_number).each(function(k, v) {
        var string_id = $(this).attr('id');
        if (typeof string_id != 'undefined'){
            var index_id = string_id.match(/\_(\d+)/);
            if (index_id != null && index_id.length > 1) {
                var new_index_id = parseInt(index_id[1], 10) + 1;
                var raise = string_id.replace(/\_(\d+)/g, '_' + new_index_id);
                $(this).attr('id', raise);
                $(this).html('');
            }
        }
    });
    return tr;
}

function running_kendoui(){
    $('select[class^="mkendo_combobox"]').kendoComboBox({filter: "contains"});
    $('input[class^="mkendo_date"]').kendoDatePicker({format: "dd-MM-yyyy"});
}

function busyHours(){ $('*').css('cursor','wait'); }