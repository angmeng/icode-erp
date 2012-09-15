Merp::Application.routes.draw do

  resources :colors

  resources :sequents

  resources :selection_die_cuts

  resources :selection_glueings

  resources :delivery_orders

  resources :quotation_request_forms do
    collection do
      get "kiv"
    end
    member do
      put "yes_button"
      put "no_button"
      get "printable"
    end
  end

  resources :received_item_and_qties

  resources :formulations

  resources :roles

  resources :inventory_management_systems

  resources :delivery_orders

  resources :sales_order_items

  resources :sales_orders

  resources :temporary_tarif_codes

  resources :sales_tax_exemption_items

  resources :inventory_issues

  resources :temporary_sources

  resources :inventory_histories

  resources :purchase_order_item_lines

  resources :purchase_order_items

  resources :incoming_rejects

  resources :sales_tax_exemptions do 
    collection do
      get "no_validation"
      get "kiv"
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
    member do
      put "remove_pr"
      put "recover"
    end
    get "kiv", :on => :collection
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
      get "customer"
      get "kiv_customers"
      get "kiv_vendors"
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
      get "non_operation"
      get "operation"
      get "finish_good"
      
      get "new_for_receive_note"
      post "post_for_receive_note"
      
      get "message"
      
    end
    
    member do
      get "current_stock"
      get "loading_product_id"
    end
  end

  resources :product_categories do
    collection do
      post "edit_window"
      post "new_folder"
      get "non_operation"
      get "operation"
      get "finish_good"
      
      get "parent"
    end
    member do
      put "remove"
      put "recover"
    end
  end

  resources :departments do
    get "kiv", :on => :collection
    put "recover", :on => :member
  end

#  devise_for :users, :controllers => { :registrations => "users" }
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users do
    member do
      get "profile"
      post "update_profile"
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
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
