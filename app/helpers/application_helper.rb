module ApplicationHelper
  
  def treeview_with_parent(category, view, customize_mode = true, with_form = false)
    view ? ret = view : ret = ""
    downlines = category.children
        
    if category.status == ProductCategory::KEEP_IN_VIEW
          
    else
      ret << "<li data-expanded='true'>"
    end
        
    if with_form  #false
          
    else
      if customize_mode #false
            
      else

        if category.status == ProductCategory::KEEP_IN_VIEW
              
        else
              
          if category.icon == ProductCategory::ICON_FILE
            ret << "<table><tr><td><span class='k-sprite file'></span></td>"
          elsif category.icon == ProductCategory::ICON_FOLDER
            ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
          else
            ret << "<table><tr><td><span class='k-sprite'>-</span></td>"
          end
            
          if category.category_type == ProductCategory::FINISH_GOOD
            if category.product.present?
              ret << "<td><div><a href='/products/finish_good_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.product.desc rescue '-'}</a></div></td></tr></table>"
            else
              ret << "<td><div><a href='/products/finish_good_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.desc rescue '-'}</a></div></td></tr></table>"
            end
          elsif category.category_type == ProductCategory::NON_OPERATION
            if category.product.present?
              ret << "<td><div><a href='/products/non_operation_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.product.desc rescue '-'}</a></div></td></tr></table>"
            else
              ret << "<td><div><a href='/products/non_operation_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.desc rescue '-'}</a></div></td></tr></table>"
            end
          elsif category.category_type == ProductCategory::OPERATION
            if category.product.present?
              ret << "<td><div><a href='/products/operation_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.product.desc rescue '-'}</a></div></td></tr></table>"
            else
              ret << "<td><div><a href='/products/operation_info?category_id=#{category.id}' class='remove_underline'>[#{category.code}]  #{category.desc rescue '-'}</a></div></td></tr></table>"
            end
          end
              
        end
      end        
    end
        
    unless downlines.empty?
      if category.status == ProductCategory::KEEP_IN_VIEW
        downlines.each do |d|
          treeview_with_parent(d, ret, customize_mode, with_form)
        end
      else
        ret << "<ul>"
        downlines.each do |d|
          treeview_with_parent(d, ret, customize_mode, with_form)
        end
        ret << "</ul>"
      end
    end
        
    if category.status == ProductCategory::KEEP_IN_VIEW
          
    else
      ret << "</li>" 
    end
        
    raw ret
  end
    
#  def treeview_with_parent_kiv(category, view, customize_mode = true, with_form = false)
#    view ? ret = view : ret = ""
#    downlines = category.children
#        
#    if category.status == ProductCategory::KEEP_IN_VIEW
#      if current_user.level == User::LEVEL_FIVE
#        ret << "<li data-expanded='true'>"
#      end
#    else
#    end
#        
#    if with_form
#      
#    else
#      if customize_mode
#      else
#        if category.icon == ProductCategory::ICON_FILE
#          ret << "<table><tr><td><span class='k-sprite file'></span></td>"
#        elsif category.icon == ProductCategory::ICON_FOLDER
#          ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
#        else
#          if category.status == ProductCategory::KEEP_IN_VIEW
#            if current_user.level == User::LEVEL_FIVE
#              if category.icon == ProductCategory::ICON_REMOVE_FILE
#                ret << "<table><tr><td><span class='k-sprite kiv_file'></span></td>"
#              elsif category.icon == ProductCategory::ICON_REMOVE_FOLDER
#                ret << "<table><tr><td><span class='k-sprite kiv_folder'></span></td>"
#              end
#            end
#          else
#            ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#          end
#        end
#
#        if category.status == ProductCategory::KEEP_IN_VIEW
#          if current_user.level == User::LEVEL_FIVE
#            if category.category_type == ProductCategory::FINISH_GOOD
#              ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a>#{category.desc}</div></td></tr></table>"
#            elsif category.category_type == ProductCategory::NON_OPERATION
#              ret << "<td><div><a href='/products/non_operation?category_id=#{category.id}'>#{category.code}</a>#{category.desc}</div></td></tr></table>"
#            elsif category.category_type == ProductCategory::OPERATION
#              ret << "<td><div><a href='/products/operation?category_id=#{category.id}'>#{category.code}</a>#{category.desc}</div></td></tr></table>"
#            end
#          end
#        else
#        end
#            
#      end        
#    end
#        
#    unless downlines.empty?
#      ret << "<ul>"
#      downlines.each do |d|
#        treeview_with_parent_kiv(d, ret, customize_mode, with_form)
#      end
#      ret << "</ul>"
#    end
#        
#    if category.status == ProductCategory::KEEP_IN_VIEW
#      if current_user.level == User::LEVEL_FIVE
#        ret << "</li>" 
#      end
#    else
#    end
#        
#    raw ret
#  end
    
#  def treeview_with_selection(category, view)
#    view ? ret = view : ret = ""
#    downlines = category.children
#    if category.status == ProductCategory::KEEP_IN_VIEW
#      if current_user.level == User::LEVEL_FIVE
#        ret << "<li data-expanded='true'>"
#      end
#    else
#      ret << "<li data-expanded='true'>"
#    end
#        
#    if category.icon == ProductCategory::ICON_FILE
#      ret << "<table><tr><td><span class='k-sprite file'></span></td>"
#    elsif category.icon == ProductCategory::ICON_FOLDER
#      ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
#    else
#      if category.status == ProductCategory::KEEP_IN_VIEW
#        if current_user.level == User::LEVEL_FIVE
#          ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#        end
#      else
#        ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#      end
#    end
#
#    if category.icon == ProductCategory::ICON_FILE
#      if category.product
#        if category.category_type == ProductCategory::FINISH_GOOD
#          ret << "<td><div class='select_product_fg' product_id=#{category.product.id} um_code=#{category.product.unit_measurement.code} width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
#        else
#          price = four_precision(category.product.selling_price)
#          ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' desc='#{category.product.desc}' unitmeasurement='#{category.product.unit_measurement.code}' unitprice='#{price}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
#        end
#      else
#        ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
#      end
#    elsif category.icon == ProductCategory::ICON_REMOVE
#      if current_user.level == User::LEVEL_FIVE
#        ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
#      end
#    else
#      ret << "<td><div>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
#    end
#
#    unless downlines.empty?
#      ret << "<ul>"
#      downlines.each do |d|
#        treeview_with_selection(d, ret)
#      end
#      ret << "</ul>"
#    end
#        
#    if category.status == ProductCategory::KEEP_IN_VIEW
#      if current_user.level == User::LEVEL_FIVE
#        ret << "</li>"
#      end
#    else
#      ret << "</li>"
#    end
#    raw ret
#  end
    
    
    
    
  def iproduct(quantity, unit_price)
    number_with_precision(quantity * unit_price, :precision => 2, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def six_precision(unit_price)
    number_with_precision(unit_price, :precision => 6, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def five_precision(unit_price)
    number_with_precision(unit_price, :precision => 5, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def four_precision(unit_price)
    number_with_precision(unit_price, :precision => 4, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def three_precision(unit_price)
    number_with_precision(unit_price, :precision => 3, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def two_precision(unit_price)
    number_with_precision(unit_price, :precision => 2, :separator => '.', :delimiter => ',') rescue '-'
  end
    
  def no_precision(unit_price)
    number_with_precision(unit_price, :precision => 0, :separator => '.', :delimiter => ',') rescue '-'
  end
    
    
    
        
  def product_category(pc)
    if pc.present?
      if pc.product 
        if pc.product.product_category 
          prod_code = [] 
          prod_code << product_parent(pc.product.product_category, false) 
          prod_code << pc.product.product_category.code
          prod_code.join("-") 
        end 
      end 
    end
  end
    
  def product_parent(category, view)
    ret = []
    view ? ret << view : ret = []
        
    if category.parent_id == 0
          
    else
      parents = category.parent        
      if parents.parent_id == 0
        ret << parents.code
        ret.flatten!
        ret.reverse
      else
        ret << parents.code
        ret.flatten!
        product_parent(parents, ret)
      end
    end
  end
    
  def cal_grandtotal(subtotal, tax)
    subtotal + (subtotal * tax / 100)
  end
    
  def product_with_vendor(product_id, trade_company_id)
    ProductVendor.find_by_product_id_and_trade_company_id(product_id, trade_company_id)
  end
    
  def find_completed_qty(company_id, tarif_code)
    sales_tax_exemption.find_by_trade_company_id_and_tarif_code(company_id, tarif_code).complete_qty rescue '-'
  end
    
  def purchase_requisition_item_status(pri)
    if pri.status == PurchaseRequisitionItem::PENDING
      "PENDING"
    elsif pri.status == PurchaseRequisitionItem::KEEP_IN_VIEW
      "KIV"
    elsif pri.status == PurchaseRequisitionItem::IN_PROCESSING
      "IN PROGRESS"
    elsif pri.status == PurchaseRequisitionItem::APPROVED
      "PENDING PO"
    elsif pri.status == PurchaseRequisitionItem::REJECT
      "REJECT"
    elsif pri.status == PurchaseRequisitionItem::RECEIVE_NOTE
      if po = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri.id)
        link_to "PO ISSUED", purchase_order_path(po.purchase_order_id), :class => "show_without_refresh_page_1600x900", "data-fancybox-type" => "iframe"
      else
        "PO ISSUED"
      end
    elsif pri.status == PurchaseRequisitionItem::RECEIVED_PARTIAL
      if po = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri.id) 
        link_to "RECEIVED PARTIAL", purchase_order_item_line_path(po), :class => "show_without_refresh_page_1600x900", "data-fancybox-type" => "iframe"
      else
        "RECEIVED PARTIAL"
      end
    elsif pri.status == PurchaseRequisitionItem::RECEIVED_FULL
      if po = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri.id)
        link_to "RECEIVED FULL", purchase_order_item_line_path(po), :class => "show_without_refresh_page_1600x900", "data-fancybox-type" => "iframe"
      else
        "RECEIVED FULL"
      end
    else
      "-"
    end
  end
    
    
    
    
    
  def link_add_item_1600x900(linked)
    link_to "Add", linked, :class => "iframe_1600x900 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def link_add_item_800x450(linked)
    link_to "Add", linked, :class => "iframe_800x450 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_add_item
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Add"
    end
  end
    
  
  def link_add_1600x900(linked)
    link_to "Add", linked, :class => "iframe_1600x900  k-button", "data-fancybox-type" => "iframe"
  end
    
  def not_link_add
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Add"
    end
  end
  
  
  def link_addnew_1600x900(linked)
    link_to "Add New", linked, :class => "iframe_1600x900 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
  
  def link_addnew_800x450(linked)
    link_to "Add New", linked, :class => "iframe_800x450 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
        
  def not_link_addnew
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Add New"
    end
  end
    
  
  def link_show_1600x900(linked)
    link_to "Show", linked, :class =>"show_without_refresh_page_1600x900 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def link_show_800x600(linked)
    link_to "Show", linked, :class => "show_without_refresh_page_800x600  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def link_show_800x450(linked)
    link_to "Show", linked, :class => "show_without_refresh_page_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_show
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Show"
    end
  end
    
  
  def not_link_remove_row
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Remove Item"
    end
  end
    
    
    
  def not_link_binary
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Show KIV"
    end
  end
    
    
    
  def link_edit_1600x900(linked)
    link_to "Edit", linked, :class => "iframe_1600x900  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
        
  def link_edit_800x600(linked)
    link_to "Edit", linked, :class => "iframe_800x600  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def link_edit_800x450(linked)
    link_to "Edit", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_edit
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Edit"
    end
  end
    
    
  def link_apply_1600x900
    link_to  "Apply", linked, :class => "iframe_1600x900  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_apply
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Apply"
    end
  end
    
  def not_link_submit_to
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Submit to"
    end
  end
    
    
    
  # PRODUCT ID
    
  def link_parent_folder(linked)
    link_to "Create Group", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_parent_folder
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do
      "Create Group"
    end
  end
    
  def link_parent_folder_edit(linked)
    link_to "Edit Group", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_parent_folder_edit
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Edit Group"
    end
  end
    
  def link_subfolder(linked)
    link_to "Add Sub Group / Product Type", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_subfolder
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Add Sub Group / Product Type"
    end
  end
    
  def link_edit_subfolder(linked)
    link_to "Edit Sub Group / Product Type", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_edit_subfolder
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Edit Sub Group / Product Type"
    end
  end
    
  def link_addfile_button(linked) 
    link_to  "Add Product ID", linked, :class => "iframe_1024x800  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_addfile_button
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Add Product ID"
    end
  end
    
  def link_document_edit(linked)
    link_to "Edit Product ID", linked, :class => "iframe_1024x800  k-button opac-icon", "data-fancybox-type" => "iframe"
  end
    
  def not_link_document_edit
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Edit Product ID"
    end
  end
    
    
    
    
    

  
  def remove_row_button
    link_to "Remove", "#", :class => "remove_datarow k-button"
  end
  
  def add_row_button(name)
    link_to "#{name}", "#", :id => "add_row_button", :class => "k-button font_bold"
  end

  def not_link_excel
    content_tag :span, :class => "k-button", :style => "color:grey ; background-color: white;" do 
      "Excel"
    end 
  end
  
  def disabled_style(name)
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do
      "#{name}"
    end
  end
  
  def disabled_menu_style(name)
    content_tag :span, :style => "color: gray; cursor: default;" do
      "#{name}"
    end
  end
  
  def title_head(name)
    content_tag :div, :class => "title_head" do
      content_tag :strong, :style => "color:white;" do
        "#{name}"
      end
    end
  end
    
    
  def link_delete(linked)
    link_to "Delete Folder", linked, confirm: "Are you sure to delete?", method: :delete, :class => "k-button"
  end
    
  def not_link_delete
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Delete"
    end
  end
  
  def link_common(linked)
    link_to "Common", linked, :class => "iframe_800x450 k-button opac-icon", "data-fancybox-type" => "iframe"
  end
  
  def link_copy(linked)
    link_to "Copy", linked, :class => "k-button", :confirm => "Are you sure to duplicate this Product ID?", :method => :post
  end
  
  def link_delete_product_id(linked)
    link_to "Delete Product ID", linked, :class => "k-button", :confirm => "Are you confirm to delete those Product ID?", method: :delete
  end
    
  def not_link_common
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Common"
    end
  end
        
  def link_kiv(linked)
    link_to "Drop to KIV", linked, confirm: 'Are you sure move to KIV?', method: :delete ,:class => "k-button"
  end
    
  def not_link_kiv
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Drop To KIV"
    end
  end

  def link_recover(linked)
    link_to "Recover", linked, confirm: 'Are you sure to recover?', :method => :put ,:class => " k-button"
  end
    
  def not_link_recover
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Recover"
    end
  end
    
  def link_recycle(linked)
    link_to  "Delete", linked, confirm: 'Are you sure to delete?', method: :delete ,:class => " k-button"
  end
    
  def not_link_recycle
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Delete"
    end
  end
    
  def link_printable(linked, type = FALSE)
    link_to  'Printer', linked, :target => "_blank" ,:class => " k-button"
  end
    
  def not_link_printable
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Printer"
    end
  end
    
  def link_submit_button
    content_tag :span, :class => "k-button" do 
      "Submit"
    end
  end
    
  def link_save_button
    submit_tag "Save", :class => "k-button font_bold", :id => "save_button", :style => "cursor: pointer;"
  end
    
  def link_fsave_button(f)
    f.submit "Save", :class => "k-button font_bold", :id => "save_button"
  end
    
  def not_link_save
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Save"
    end
  end
    
  def link_close_button
    link_to 'Close' , "#" , :class=>"k-button font_bold", :onclick => "parent.$.fancybox.close();"
  end
    
  def link_home_button
    link_to 'Home' , root_url , :class=>"k-button font_bold"
  end
    
  def link_mail_button
    submit_tag "Send Mail", :class => "k-button font_bold", :id => "send_button"
  end
    
  def not_link_cost
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Costing Sheet"
    end
  end
   
  def link_remove(linked)
    link_to "Remove", linked, confirm: 'Are you sure to remove?', :method => :put ,:class => " k-button"
  end
    
  def not_link_remove
    content_tag :span, :class => "k-button", :style => "color: grey; background-color: white; cursor: default;" do 
      "Remove"
    end
  end
  
  
  
  def um_code(unit_measurement_id)
    UnitMeasurement.find(unit_measurement_id).code rescue '-'
  end
    
  def search_button
    link_to 'Search', "#", :class => "search_link"
  end
  
  def search_button_with_f(f)
    f.submit 'Search', :class => "k-button", :style => "float: right;"
  end
  
    
  def popup_product_id(product)
    link_to(product_path(product.id), { :class => "show_without_refresh_page_800x600", "data-fancybox-type" => "iframe"}) do
      product.product_combobox.product_code rescue '-'
    end
  end
    
  def company_code_and_name(trade_company)
    "[#{trade_company.code}] #{trade_company.name}" rescue '-'
  end

  def updater_name(user_id)
    User.find_by_id(user_id).name rescue '-'
  end
end

