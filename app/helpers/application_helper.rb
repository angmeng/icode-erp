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
        
        if category.keep_in_view == TRUE
          if current_user.level == User::LEVEL_FIVE
            ret << "<li data-expanded='true'>"
          end
        else
          ret << "<li data-expanded='true'>"
        end
        
        if with_form
          if category.icon == ProductCategory::ICON_FILE
            ret << "<table><tr><td><span class='k-sprite file'></span></td>"
          elsif category.icon == ProductCategory::ICON_FOLDER
            ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
          else
            if category.keep_in_view == TRUE
              if current_user.level == User::LEVEL_FIVE
                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
              end
            else
              ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
            end
          end
          
          if category.keep_in_view == TRUE
            if current_user.level == User::LEVEL_FIVE
              ret << "<td><div>#{category.code}</div></td>"
              ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
            end
          else
            ret << "<td><div>#{category.code}</div></td>"
            ret << "<td>[" << generate_posting_form(category) << "]</td></tr></table>"
          end
        else
          if customize_mode
#            ret << "<div class='display-category' id='category-id-#{category.id}' data-url=''><a href='/product?category_id=#{category.id}'>#{category.code}</a></div>" 
          else
            if category.icon == ProductCategory::ICON_FILE
              ret << "<table><tr><td><span class='k-sprite file'></span></td>"
            elsif category.icon == ProductCategory::ICON_FOLDER
              ret << "<table><tr><td><span class='k-sprite folder'></span></td>"
            else
              if category.keep_in_view == TRUE
                if current_user.level == User::LEVEL_FIVE
                  ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
                end
              else
                ret << "<table><tr><td><span class='k-sprite remove_file'></span></td>"
              end
            end

            if category.keep_in_view == TRUE
              if current_user.level == User::LEVEL_FIVE
                if category.category_type == ProductCategory::OPERATION
                  ret << "<td><div><a href='/products/operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                elsif category.category_type == ProductCategory::NON_OPERATION
                  ret << "<td><div><a href='/products/non_operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                else
                  ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
                end
              end
            else
              if category.category_type == ProductCategory::OPERATION
                ret << "<td><div><a href='/products/operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
              elsif category.category_type == ProductCategory::NON_OPERATION
                ret << "<td><div><a href='/products/non_operation?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
              else
                ret << "<td><div><a href='/products/finish_good?category_id=#{category.id}'>#{category.code}</a></div></td></tr></table>"
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
        
        if category.keep_in_view == TRUE
          if current_user.level == User::LEVEL_FIVE
            ret << "</li>" 
          end
        else
          ret << "</li>" 
        end
        
        raw ret
    end
    
    def treeview_with_selection(category, view)
        view ? ret = view : ret = ""
        downlines = category.children
        if category.keep_in_view == TRUE
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
          if category.keep_in_view == TRUE
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
              price = number_with_precision(category.product.selling_price, :precision => 5)
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
        
        if category.keep_in_view == TRUE
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
    
    def four_precision(unit_price)
      number_with_precision(unit_price, :precision => 4, :separator => '.', :delimiter => ',') rescue '-'
    end
    
    def two_precision(unit_price)
      number_with_precision(unit_price, :precision => 2, :separator => '.', :delimiter => ',') rescue '-'
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
    
    def cal_grandtotal(subtotal, tax)
      subtotal + (subtotal * tax / 100)
    end
    
    def product_with_vendor(product_id, trade_company_id)
      ProductVendor.find_by_product_id_and_trade_company_id(product_id, trade_company_id)
    end
    
    def find_completed_qty(company_id, tarif_code)
      sales_tax_exemption.find_by_trade_company_id_and_tarif_code(company_id, tarif_code).remaining_total rescue '-'
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
    
    
    def link_add_1600x900(linked)
      link_to image_tag("add_item_button.png", :alt => "Add or Exist Files", :title => "Add or Exist Files", :class => "cube35"), linked, :class => "iframe_1600x900", "data-fancybox-type" => "iframe"
    end
    
    def not_link_add
      image_tag("add_item_button.png", :alt => "Add or Exist Files", :title => "Add or Exist Files", :class => "opac_icon")
    end
    
    
    
    
    def link_addnew_1600x900(linked)
      link_to image_tag("add_item_button.png", :alt => "Add New", :title => "Add New", :class => "cube35"), linked, :class => "show_without_refresh_page_1600x900", "data-fancybox-type" => "iframe"
    end
    
    def not_link_addnew
      image_tag("add_item_button.png", :alt => "Add New", :title => "Add New", :class => "opac_icon")
    end
    
    
    
    def link_show_1600x900(linked)
      link_to image_tag("viewIcon.png", :alt => "Show", :title => "Show", :class => "cube35"), linked, :class => "show_without_refresh_page_1600x900", "data-fancybox-type" => "iframe"
    end
    
    def link_show_800x600(linked)
      link_to image_tag("viewIcon.png", :alt => "Show", :title => "Show", :class => "cube35"), linked, :class => "show_without_refresh_page_800x600", "data-fancybox-type" => "iframe"
    end
    
    def link_show_800x450(linked)
      link_to image_tag("viewIcon.png", :alt => "Show", :title => "Show", :class => "cube35"), linked, :class => "show_without_refresh_page_800x450", "data-fancybox-type" => "iframe"
    end
    
    def not_link_show
      image_tag("viewIcon.png", :alt => "Show", :title => "Show", :class => "opac_icon")
    end
    
    
    
    def not_link_binary
      image_tag("binary_icon.png", :alt => "Show KIV", :title => "Show KIV", :class => "opac_icon")
    end
    
    
    
    def link_edit_1600x900(linked)
      link_to image_tag("pen.png", :alt => "Edit", :title => "Edit", :class => "cube35"), linked, :class => "iframe_1600x900", "data-fancybox-type" => "iframe"
    end
        
    def link_edit_800x600(linked)
      link_to image_tag("pen.png", :alt => "Edit", :title => "Edit", :class => "cube35"), linked, :class => "iframe_800x600", "data-fancybox-type" => "iframe"
    end
    
    def link_edit_800x450(linked)
      link_to image_tag("pen.png", :alt => "Edit", :title => "Edit", :class => "cube35"), linked, :class => "iframe_800x450", "data-fancybox-type" => "iframe"
    end
    
    def not_link_edit
      image_tag("pen.png", :alt => "Edit", :title => "Edit", :class => "opac_icon")
    end
    
    
    def link_apply_1600x900
      link_to image_tag("add_new_file.png", :alt => "Apply", :title => "Apply", :class => "cube35"), linked, :class => "iframe_1600x900", "data-fancybox-type" => "iframe"
    end
    
    def not_link_apply
      image_tag("add_new_file.png", :alt => "Apply", :title => "Apply", :class => "opac_icon")
    end
    
    def not_link_submit_to
      image_tag("document_check.png", :alt => "Submit to", :title => "Submit to", :class => "opac_icon")
    end
    
    
    
    
    
    def link_parent_folder(linked)
      link_to image_tag("parent_folder.png", :alt => "Create Parent Folder", :title => "Create Parent Folder", :class => "cube35"), linked, :class => "iframe_800x450", "data-fancybox-type" => "iframe"
    end
    
    def not_link_parent_folder
      image_tag("parent_folder.png", :alt => "Create Parent Folder", :title => "Create Parent Folder", :class => "opac_icon")
    end
    
    def link_subfolder(linked)
      link_to image_tag("treeview_folder_open.gif", :alt => "Add Sub Folder", :title => "Add Sub Folder", :class => "cube35"), linked, :class => "iframe_800x450", "data-fancybox-type" => "iframe"
    end
    
    def not_link_subfolder
      image_tag("treeview_folder_open.gif", :alt => "Add Sub Folder", :title => "Add Sub Folder", :class => "opac_icon")
    end
    
    def link_edit_subfolder(linked)
      link_to image_tag("edit_folder.png", :alt => "Edit Sub Folder", :title => "Edit Sub Folder", :class => "cube35"), linked, :class => "iframe_800x450", "data-fancybox-type" => "iframe"
    end
    
    def not_link_edit_subfolder
      image_tag("edit_folder.png", :alt => "Edit Sub Folder", :title => "Edit Sub Folder", :class => "opac_icon")
    end
    
    def link_addfile_button(linked) 
      link_to image_tag("treeview_file.gif", :alt => "add new file", :title => "Add New File", :class => "cube35"), linked, :class => "iframe_1024x800", "data-fancybox-type" => "iframe"
    end
    
    def not_link_addfile_button
      image_tag("treeview_file.gif", :alt => "Add New File", :title => "Add New File", :class => "opac_icon")
    end
    
    def link_document_edit(linked)
      link_to image_tag("edit_file.png", :alt => "Edit File", :title => "Edit File", :class => "cube35"), linked, :class => "iframe_1024x800", "data-fancybox-type" => "iframe"
    end
    
    def not_link_document_edit
      image_tag("edit_file.png", :alt => "Edit File", :title => "Edit File", :class => "opac_icon")
    end
    
    
    
    
    
    def link_remove(linked)
      link_to image_tag("remove_icon.jpg", :alt => "Remove", :title => "Remove", :class => "cube35"), linked, confirm: 'Are you sure to remove?', :method => :put
    end
    
    def not_link_remove
      image_tag("remove_icon.jpg", :alt => "Remove", :title => "Remove", :class => "opac_icon")
    end
    
    
    
    
    def link_kiv(linked)
      link_to image_tag("in_box.png", :alt => "Drop to KIV", :title => "Drop to KIV", :class => "cube35"), linked, confirm: 'Are you sure move to KIV?', method: :delete
    end
    
    def not_link_kiv
      image_tag("in_box.png", :alt => "KIV", :title => "Drop to KIV", :class => "opac_icon")
    end
    
    
    

    def link_recover(linked)
      link_to image_tag("out_box.jpg", :alt => "RECOVER", :title => "RECOVER", :class => "cube35"), linked, confirm: 'Are you sure to recover?', :method => :put
    end
    
    def not_link_recover
      image_tag("out_box.jpg", :alt => "RECOVER", :title => "RECOVER", :class => "opac_icon")
    end
    
    
    
    def link_recycle(linked)
      link_to image_tag("trash.png", :alt => "Recycle", :title => "Delete", :class => "cube35"), linked, confirm: 'Are you sure to delete?', method: :delete
    end
    
    def not_link_recycle
      image_tag("trash.png", :alt => "Recycle", :title => "Delete", :class => "opac_icon")
    end
    
    
    
    def link_printable(linked, type = FALSE)
      link_to image_tag("printer.png", :alt => "Printer", :title => 'Printer', :class => "cube35"), linked, :target => "_blank"
    end
    
    def not_link_printable
      image_tag("printer.png", :alt => "Printer", :title => 'Printer', :class => "opac_icon")
    end
    
    
    
    def link_submit_button
      image_submit_tag("submit_icon.png", :alt => "Submit", :title => "Submit", :class => "cube35")
    end
    
    def link_save_button
      image_submit_tag("save_icon.png", :alt => "Save", :title => "Save", :class => "cube35")
    end
    
    def not_link_save
      image_submit_tag("save_icon.png", :alt => "Save", :title => "Save", :class => "opac_icon")
    end
    
    def link_close_button
      link_to image_tag("close_red.png", :alt => "Close", :title => 'Close', :class => "cube35"), "#", :onclick => "parent.$.fancybox.close();"
    end
    
    

    
    
    def um_code(unit_measurement_id)
      UnitMeasurement.find(unit_measurement_id).code rescue '-'
    end

end

