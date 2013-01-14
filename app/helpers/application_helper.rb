module ApplicationHelper
    def generate_posting_form(category)
        add_icon     = link_to "New", "#", :class => "add-category-link", :id => "add-category-link-#{category.id}"
        edit_icon    = link_to "Edit", "#", :class => "edit-category-link", :id => "edit-category-link-#{category.id}"
        remove_icon  = link_to "Remove", remove_product_category_path(category), :method => :put, :confirm => "Are you sure to remove?"
        delete_icon  = link_to "Delete", category, :method => :delete, :confirm => "Are you sure to delete?"
        recover_icon = link_to "Restore", recover_product_category_path(category), :method => :put, :confirm => "Are you sure to restore?"
       
        if category.keep_in_view == TRUE
          if current_user.level == User::LEVEL_FIVE
            "#{recover_icon} #{delete_icon}"
          end
        else
          if current_user.level == User::LEVEL_FIVE
           "#{add_icon} #{edit_icon} #{remove_icon}"
          else
           "#{add_icon} #{edit_icon}"
          end
        end
    end
    
    def treeview_with_parent(category, view, customize_mode = true, with_form = false)
        view ? ret = view : ret = ""
        downlines = category.children
        
        if category.status == ProductCategory::KEEP_IN_VIEW
#          if current_user.level == User::LEVEL_FIVE
#            ret << "<li data-expanded='true'>"
#          end
        else
          ret << "<li data-expanded='true'>"
        end
        
        if with_form  #false
#          if category.icon == ProductCategory::ICON_FILE
#            ret << "<table><tr><td><span class='k-sprite file'></span></td>"
#          elsif category.icon == ProductCategory::ICON_FOLDER
#            ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
#          else
#            if category.status == ProductCategory::KEEP_IN_VIEW
#              if current_user.level == User::LEVEL_FIVE
#                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#              end
#            else
#              ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#            end
#          end
#          
#          if category.status == ProductCategory::KEEP_IN_VIEW
#            if current_user.level == User::LEVEL_FIVE
#              ret << "<td><div>#{category.code}</div></td>"
#              ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
#            end
#          else
#            ret << "<td><div>#{category.code}</div></td>"
#            ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
#          end
        else
          if customize_mode #false
#            ret << "<div class='display-category' id='category-id-#{category.id}' data-url=''><a href='/product?category_id=#{category.id}'>#{category.code}</a></div>" 
          else
            if category.icon == ProductCategory::ICON_FILE
              ret << "<table><tr><td><span class='k-sprite file'></span></td>"
            elsif category.icon == ProductCategory::ICON_FOLDER
              ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
            else
#              if category.status == ProductCategory::KEEP_IN_VIEW
#                if current_user.level == User::LEVEL_FIVE
#                  if category.icon == ProductCategory::ICON_REMOVE_FILE
#                    ret << "<table><tr><td><span class='k-sprite kiv_file'></span></td>"
#                  elsif category.icon == ProductCategory::ICON_REMOVE_FOLDER
#                    ret << "<table><tr><td><span class='k-sprite kiv_folder'></span></td>"
#                  end
#                end
#              else
#                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#              end
            end

            if category.status == ProductCategory::KEEP_IN_VIEW
#              if current_user.level == User::LEVEL_FIVE
#                if category.category_type == ProductCategory::FINISH_GOOD
#                  ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::RAW_MATERIAL
#                  ret << "<td><div><a href='/products/raw_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::SUB_MATERIAL
#                  ret << "<td><div><a href='/products/sub_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::PACKAGING
#                  ret << "<td><div><a href='/products/packaging?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::COMMERCIAL
#                  ret << "<td><div><a href='/products/commercial?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                end
#              end
            else
              if category.category_type == ProductCategory::FINISH_GOOD
                ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
              elsif category.category_type == ProductCategory::NON_OPERATION
                ret << "<td><div><a href='/products/non_operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
              elsif category.category_type == ProductCategory::OPERATION
                ret << "<td><div><a href='/products/operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
              end
            end
            
          end        
        end
        
        unless downlines.empty?
          ret << "<ul>"
          downlines.each do |d|
            treeview_with_parent(d, ret, customize_mode, with_form)
          end
          ret << "</ul>"
        end
        
        if category.status == ProductCategory::KEEP_IN_VIEW
#          if current_user.level == User::LEVEL_FIVE
#            ret << "</li>" 
#          end
        else
          ret << "</li>" 
        end
        
        raw ret
    end
    
    def treeview_with_parent_kiv(category, view, customize_mode = true, with_form = false)
        view ? ret = view : ret = ""
        downlines = category.children
        
        if category.status == ProductCategory::KEEP_IN_VIEW
          if current_user.level == User::LEVEL_FIVE
            ret << "<li data-expanded='true'>"
          end
        else
#          ret << "<li data-expanded='true'>"
        end
        
        if with_form  #false
#          if category.icon == ProductCategory::ICON_FILE
#            ret << "<table><tr><td><span class='k-sprite file'></span></td>"
#          elsif category.icon == ProductCategory::ICON_FOLDER
#            ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
#          else
#            if category.status == ProductCategory::KEEP_IN_VIEW
#              if current_user.level == User::LEVEL_FIVE
#                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#              end
#            else
#              ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
#            end
#          end
#          
#          if category.status == ProductCategory::KEEP_IN_VIEW
#            if current_user.level == User::LEVEL_FIVE
#              ret << "<td><div>#{category.code}</div></td>"
#              ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
#            end
#          else
#            ret << "<td><div>#{category.code}</div></td>"
#            ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
#          end
        else
          if customize_mode #false
#            ret << "<div class='display-category' id='category-id-#{category.id}' data-url=''><a href='/product?category_id=#{category.id}'>#{category.code}</a></div>" 
          else
            if category.icon == ProductCategory::ICON_FILE
              ret << "<table><tr><td><span class='k-sprite file'></span></td>"
            elsif category.icon == ProductCategory::ICON_FOLDER
              ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
            else
              if category.status == ProductCategory::KEEP_IN_VIEW
                if current_user.level == User::LEVEL_FIVE
                  if category.icon == ProductCategory::ICON_REMOVE_FILE
                    ret << "<table><tr><td><span class='k-sprite kiv_file'></span></td>"
                  elsif category.icon == ProductCategory::ICON_REMOVE_FOLDER
                    ret << "<table><tr><td><span class='k-sprite kiv_folder'></span></td>"
                  end
                end
              else
                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
              end
            end

            if category.status == ProductCategory::KEEP_IN_VIEW
              if current_user.level == User::LEVEL_FIVE
                if category.category_type == ProductCategory::FINISH_GOOD
                  ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                elsif category.category_type == ProductCategory::NON_OPERATION
                  ret << "<td><div><a href='/products/non_operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                elsif category.category_type == ProductCategory::OPERATION
                  ret << "<td><div><a href='/products/operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::RAW_MATERIAL
#                  ret << "<td><div><a href='/products/raw_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::SUB_MATERIAL
#                  ret << "<td><div><a href='/products/sub_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::PACKAGING
#                  ret << "<td><div><a href='/products/packaging?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#                elsif category.category_type == ProductCategory::COMMERCIAL
#                  ret << "<td><div><a href='/products/commercial?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                end
              end
            else
#              if category.category_type == ProductCategory::FINISH_GOOD
#                ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#              elsif category.category_type == ProductCategory::RAW_MATERIAL
#                ret << "<td><div><a href='/products/raw_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#              elsif category.category_type == ProductCategory::SUB_MATERIAL
#                ret << "<td><div><a href='/products/sub_material?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#              elsif category.category_type == ProductCategory::PACKAGING
#                ret << "<td><div><a href='/products/packaging?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#              elsif category.category_type == ProductCategory::COMMERCIAL
#                ret << "<td><div><a href='/products/commercial?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
#              end
            end
            
          end        
        end
        
        unless downlines.empty?
          ret << "<ul>"
          downlines.each do |d|
            treeview_with_parent_kiv(d, ret, customize_mode, with_form)
          end
          ret << "</ul>"
        end
        
        if category.status == ProductCategory::KEEP_IN_VIEW
          if current_user.level == User::LEVEL_FIVE
            ret << "</li>" 
          end
        else
#          ret << "</li>" 
        end
        
        raw ret
    end
    
    def treeview_with_selection(category, view)
        view ? ret = view : ret = ""
        downlines = category.children
#        if category.keep_in_view == TRUE
        if category.status == ProductCategory::KEEP_IN_VIEW
          if current_user.level == User::LEVEL_FIVE
            ret << "<li data-expanded='true'>"
          end
        else
          ret << "<li data-expanded='true'>"
        end
        
        if category.icon == ProductCategory::ICON_FILE
          ret << "<table><tr><td><span class='k-sprite file'></span></td>"
        elsif category.icon == ProductCategory::ICON_FOLDER
          ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
        else
          if category.status == ProductCategory::KEEP_IN_VIEW
#          if category.keep_in_view == TRUE
            if current_user.level == User::LEVEL_FIVE
              ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
            end
          else
              ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
          end
        end

        if category.icon == ProductCategory::ICON_FILE
          if category.product
            if category.category_type == ProductCategory::FINISH_GOOD
              ret << "<td><div class='select_product_fg' product_id=#{category.product.id} um_code=#{category.product.unit_measurement.code} width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
            else
              price = four_precision(category.product.selling_price)
              ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' desc='#{category.product.desc}' unitmeasurement='#{category.product.unit_measurement.code}' unitprice='#{price}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
            end
          else
            ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
          end
        elsif category.icon == ProductCategory::ICON_REMOVE
          if current_user.level == User::LEVEL_FIVE
            ret << "<td><div class='select_product' category_id=#{category.product.id} title='#{category.code}' width='300'>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
          end
        else
          ret << "<td><div>#{category.code}&nbsp;&nbsp;&nbsp;#{category.desc}</div></td></tr></table>"
        end

        unless downlines.empty?
          ret << "<ul>"
          downlines.each do |d|
            treeview_with_selection(d, ret)
          end
          ret << "</ul>"
        end
        
#        if category.keep_in_view == TRUE
        if category.status == ProductCategory::KEEP_IN_VIEW
          if current_user.level == User::LEVEL_FIVE
            ret << "</li>"
          end
        else
          ret << "</li>"
        end
        raw ret
    end
    
    
    
    
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
    
#    def collection_supplier
#      array ||= []
#      Product.all.each do |c|
#        unless c.product_category.try(:category_type) == ProductCategory::FINISH_GOOD
#          array <<  [c.code, c.id]
#        end
#      end
#      return array
#    end
    
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
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Add"
      end
    end
    
    def link_add_1600x900(linked)
      link_to "Add", linked, :class => "iframe_1600x900  k-button", "data-fancybox-type" => "iframe"
    end
    
    def not_link_add
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Add"
      end
    end
    
    
    
    
    def link_addnew_1600x900(linked)
      link_to "Add New", linked, :class => "show_without_refresh_page_1600x900  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_addnew
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
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
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Show"
      end
    end
    
    def not_link_remove_row
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Remove Item"
      end
    end
    
    
    
    def not_link_binary
     content_tag :span, :class => "k-button", :style => "color: grey;" do 
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
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Edit"
      end
    end
    
    
    def link_apply_1600x900
      link_to  "Apply", linked, :class => "iframe_1600x900  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_apply
       content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Apply"
      end
    end
    
    def not_link_submit_to
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Submit to"
      end
    end
    
    
    
    # PRODUCT ID
    
    def link_parent_folder(linked)
      link_to "Create Group", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_parent_folder
     content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Create Group"
      end
    end
    
    def link_parent_folder_edit(linked)
      link_to "Edit Group", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_parent_folder_edit
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Edit Group"
      end
    end
    
    def link_subfolder(linked)
      link_to "Add Sub Group / Product Type", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_subfolder
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Add Sub Group / Product Type"
      end
    end
    
    def link_edit_subfolder(linked)
      link_to "Edit Sub Group / Product Type", linked, :class => "iframe_800x450  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_edit_subfolder
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Edit Sub Group / Product Type"
      end
    end
    
    def link_addfile_button(linked) 
      link_to  "Add Product ID", linked, :class => "iframe_1024x800  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_addfile_button
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Add Product ID"
      end
    end
    
    def link_document_edit(linked)
      link_to "Edit Product ID", linked, :class => "iframe_1024x800  k-button opac-icon", "data-fancybox-type" => "iframe"
    end
    
    def not_link_document_edit
       content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Edit Product ID"
      end
    end
    
    
    
    
    
    def link_remove(linked)
      link_to "Remove", linked, confirm: 'Are you sure to remove?', :method => :put ,:class => " k-button"
    end
    
    def not_link_remove
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Remove"
      end
    end
    
    
    
    
    def link_kiv(linked)
      link_to "Drop to KIV", linked, confirm: 'Are you sure move to KIV?', method: :delete ,:class => " k-button"
    end
    
    def not_link_kiv
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Drop To KIV"
      end
    end
    
    
    

    def link_recover(linked)
      link_to "Recover", linked, confirm: 'Are you sure to recover?', :method => :put ,:class => " k-button"
    end
    
    def not_link_recover
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Recover"
      end
    end
    
    
    
    def link_recycle(linked)
      link_to  "Delete", linked, confirm: 'Are you sure to delete?', method: :delete ,:class => " k-button"
    end
    
    def not_link_recycle
       content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Delete"
      end
    end
    
    
    
    def link_printable(linked, type = FALSE)
      link_to  'Printer', linked, :target => "_blank" ,:class => " k-button"
    end
    
    def not_link_printable
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Printer"
      end
    end
    
    
    
    def link_submit_button
      content_tag :span, :class => "k-button" do 
        "Submit"
      end
    end
    
    def link_save_button
      submit_tag "Save", :class => "k-button"
    end
    
    def not_link_save
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
        "Save"
      end
    end
    
    def link_close_button
      link_to 'Close', "#", :class=>"k-button" , :onclick => "parent.$.fancybox.close();" ,:class => " k-button"
    end
    
    def link_mail_button
      content_tag :span, :class => "k-button" do 
        "Send Mail"
      end
    end
    
    
    
    def not_link_cost
      content_tag :span, :class => "k-button", :style => "color: grey;" do 
       "Costing Sheet"
      end
    end
    

    
    
    def um_code(unit_measurement_id)
      UnitMeasurement.find(unit_measurement_id).code rescue '-'
    end

end
