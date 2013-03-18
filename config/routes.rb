Merp::Application.routes.draw do

  resources :statement_of_accounts

  get "documentation/product_rule"

  resources :payment_receiveds do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :debit_notes do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :credit_notes do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :receipt_items

  resources :receipts do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :product_running_numbers
  resources :stock_outs

  resources :reports do
    collection do
    get "pr_report"
    get "price_report"
    get "po_report"
    #get "po_detail_report"
    #get "fg_transaction_cw"
    get "sales_tax_exemption_report"
    get "sales_order_summary_report"
    get "sales_cj5_summary_co_report"
    get "so_customer_po_detail_report"
    get "product_report"
    get "company_report"
    get "purchase_by_creditor_report"
    get "inventory_report"
    get "customer_report"
    get "receive_note_report"
    get "rn_part_summary_report"

    get "pdf_sales_tax_exemption_report"
    get "pdf_sales_order_summary_report"
    get "pdf_purchase_by_creditor_report"
    get "pdf_product_report"
    get "pdf_inventory_report"
    get "pdf_pr_report"
    get "pdf_po_report"
    get "pdf_receive_note_report"
    get "pdf_sales_cj5_summary_co_report"
    get "pdf_so_customer_po_detail_report"

    get "excel_sales_cj5_summary_co_report"
    get "excel_product_report"
    get "excel_inventory_report"
    get "excel_pr_report"
    get "excel_po_report"
    get "excel_receive_note_report"
    get "excel_sales_tax_exemption_report"
    get "excel_sales_order_summary_report"
    get "excel_so_customer_po_detail_report"
    
    end 
  end


  resources :delivery_order_items

  resources :group_running_nos

  resources :change_company_codes

  resources :sales_tax_exemption_barangs

  resources :packing_quantities

  resources :contacts

  resources :product_fields

  resources :quotation_attachment_pos

  resources :product_customers do
    collection do
      get "matching_product_customer"
      get "take_data"
    end
  end

  resources :product_comboboxes do
    collection do
      get "supplier_product_description"
    end
  end

  resources :price_control_items

  resources :price_controls do 
    collection do
      get "take_old_unit_price_and_eff_date"
      get "kiv"
    end
    member do
#      get "moving_kiv"
      put "recover"
    end
  end

  resources :costing_sheet_changelogs

  resources :costing_sheet_formulations do
    collection do
      get "kiv"
    end
    member do
      put "recover"
    end
  end

  resources :costing_sheets do
    collection do
      get "kiv"
    end
    member do
      put "recover"
      get 'printable'
    end
  end

  resources :selection_flute_sizes

  resources :selection_die_cut_moulds

  resources :selection_stamping_sizes

  resources :custom_productions

  resources :selection_fieldsets

  resources :selection_stampings

  resources :selection_printing_sizes

  resources :pre_print_types

  resources :material_of_quantities

  resources :selection_varnish_types

  resources :colors

  resources :sequents

  resources :selection_die_cuts

  resources :selection_glueings

  resources :delivery_orders

  resources :quotation_request_forms do
    collection do
      get "kiv"
      get "kiv_items"
      get "pending_quotation"
      get "signature_quotation"
      post "update_checkboxes"
      post "customer_confirm"
      post "sending_mail"
      get "feedback"
    end
    member do
      put "yes_button"
      put "no_button"
      put "quoter_press_yes"
      get "printable"
      get "mailing"
      put "recover"
    end
  end

  resources :received_item_and_qties

  resources :formulations

  resources :roles

  resources :inventory_management_systems

  resources :delivery_orders

  resources :sales_order_items do
    collection do
      get "kiv"
    end
    member do
      put "recover"
    end
  end
  

  resources :sales_orders do
    collection do
      get "customer_registration"
      get "product_registration"
      get "production"
    end
  end

  resources :sales_tax_exemption_items

  resources :inventory_issues

  resources :temporary_sources

  resources :inventory_histories

  resources :purchase_order_item_lines

  resources :purchase_order_items

  resources :incoming_rejects

  resources :sales_tax_exemptions do 
    collection do
      get "customer"
      get "new_customer"
#      get "supplier_invalid"
#      get "customer_invalid"
      get "kiv_supplier"
      get "kiv_customer"
    end
    member do
      get "display_items"
      put "recover"
    end
  end

  resources :customs

  resources :receive_note_items

  resources :receive_notes do
    get "info", :on => :collection
  end

  resources :payment_types

  resources :purchase_requisition_items do 
    collection do
      get "product_vendor_unit_price_in_pr"
      get "kiv"
    end
    member do
      put "remove_pr"
      put "recover"
    end
  end

  resources :product_vendors

  resources :purchase_requisitions do 
    collection do
      get "show_details_two"
      get "show_details_three"
      get "pr_no"
      get "pr_status"
      get "pr_requestor"
      get "pr_department"
      get "kiv"
      get "signature_report"
    end
    
    member do
      put "yes_approval_requester"
      put "yes_approval_one"
      put "no_approval_one"
      put "yes_approval_om"
      put "no_approval_om"
      put "yes_approval_three"
      put "no_approval_three"
      put "recover"
    end
  end

  resources :transports do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :currencies do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end
  
  resources :purchase_orders do
    collection do
      get "cancel"
      get "kiv"
      get "select_vendor"
      get "approved_pr"
      get "maintenance"
      post "add_vendor"
      get "proposed_vendor"
      get "pending_approval"
      get "vendor"
      get "no_product_id"
      get "make_purchase_order"
      post "create_without_sales_tax_exemption"
    end
    
    member do
      post "change_vendor"
      put "proposed_approval"
      get "show_select_vendor"
      get "approval_yes"
      put "approval_yes"
      get "approval_no"
      put "approval_no"
      get "printable"
      get "display_maintenance"
      put "submit_vselect"
      put "recover"
    end
  end

  resources :product_prices

  resources :trade_terms do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :type_of_sales

  resources :trade_companies do
    collection do
      get "auto_complete"
      get "all_trade_companies"
      get "all_suppliers"
      get "all_customers"
      get "customer"
      get "kiv_customers"
      get "kiv_vendors"
      get "active_customer"
      get "customer_name_n_place_customer_id"
    end
    put "recover", :on => :member
  end

  resources :company_profiles

  resources :unit_measurements do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

  resources :products do
    collection do
      get "message"
      get "non_operation"
      get "non_operation_info"
      get "operation"
      get "operation_info"
      get "finish_good"
      get "finish_good_info"
      
      get "kiv_non_operation"
      get "kiv_non_operation_info"
      get "kiv_operation"
      get "kiv_operation_info"
      get "kiv_finish_good"
      get "kiv_finish_good_info"
      
      get "new_for_receive_note"
      post "post_for_receive_note"
      get "look_product_desc"
    end
    
    member do
      get "current_stock"
      get "loading_product_id"
    end
  end

  resources :product_categories do
    collection do
      post "new_folder"
      post "add_group"
      
      get "non_operation"
      get "operation"
      get "finish_good"
      
      get "parent"
      get "err_msg"
    end
    member do
      get "click_edit_group"
      put "remove"
      put "recover"
      put "edit_group"
      delete "delete_data"
      get "common"
      post "update_common"
    end
  end

  resources :departments do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users do
    member do
#      get "profile"
#      post "update_profile"
      put "recover"
    end
    collection do
      get "backup"
      get "new_user_entry"
      get "kiv"
      post "generator_user"
      get "lookup_level"
      get "clear_database"
    end
  end
  
  get "home/index"

  resources :settings
  
  root :to => 'home#index'
end
