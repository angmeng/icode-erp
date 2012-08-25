# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120824160656) do

  create_table "colors", :force => true do |t|
    t.string   "color_code"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "company_profiles", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "tel_no_1"
    t.string   "tel_no_2"
    t.string   "fax_no"
    t.string   "sales_tax_no"
    t.string   "reg_no"
    t.integer  "sn_sales_order_no",         :default => 0
    t.integer  "sn_purchase_order_no",      :default => 0
    t.integer  "sn_deliver_order_no",       :default => 0
    t.integer  "sn_receive_note_no",        :default => 0
    t.integer  "sn_transfer_slip_no",       :default => 0
    t.integer  "sn_store_voucher_no",       :default => 0
    t.integer  "sn_incoming_reject_no",     :default => 0
    t.integer  "sn_outgoing_reject_no",     :default => 0
    t.integer  "sn_credit_note_no",         :default => 0
    t.integer  "sn_debit_note_no",          :default => 0
    t.integer  "sn_billing_order_no",       :default => 0
    t.integer  "sn_purchase_req_no",        :default => 0
    t.integer  "sn_product_price_no",       :default => 0
    t.integer  "sn_job_order_no",           :default => 0
    t.integer  "sn_shipment_schedule",      :default => 0
    t.integer  "sn_scrap_sheet_no",         :default => 0
    t.integer  "sn_receiving_instr_no",     :default => 0
    t.integer  "sn_shipping_instr_no",      :default => 0
    t.integer  "sn_receipt_no",             :default => 0
    t.integer  "sn_bankin_slip_no",         :default => 0
    t.integer  "sn_journal_voucher_no",     :default => 0
    t.integer  "sn_payment_voucher_no",     :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "sn_product_id_no"
    t.integer  "sn_sales_tax_exemption_no", :default => 0
    t.integer  "sn_quotation_request_no",   :default => 0
  end

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "delivery_orders", :force => true do |t|
    t.integer  "do_no"
    t.integer  "trade_company_id"
    t.integer  "sales_tax",           :default => 0
    t.integer  "type_of_sales_id"
    t.float    "tport_c"
    t.integer  "currency_id"
    t.integer  "bk_two"
    t.integer  "trade_term_id"
    t.integer  "updated_by"
    t.integer  "transport_id"
    t.string   "sales_rep"
    t.string   "sales_tax_exemption"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "delivery_orders", ["currency_id"], :name => "index_delivery_orders_on_currency_id"
  add_index "delivery_orders", ["trade_company_id"], :name => "index_delivery_orders_on_trade_company_id"
  add_index "delivery_orders", ["trade_term_id"], :name => "index_delivery_orders_on_trade_term_id"
  add_index "delivery_orders", ["transport_id"], :name => "index_delivery_orders_on_transport_id"
  add_index "delivery_orders", ["type_of_sales_id"], :name => "index_delivery_orders_on_type_of_sales_id"

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "formulations", :force => true do |t|
    t.decimal  "per_value",                :precision => 8, :scale => 2
    t.integer  "from_unit_measurement_id"
    t.decimal  "convert_value",            :precision => 8, :scale => 2
    t.integer  "to_unit_measurement_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "incoming_rejects", :force => true do |t|
    t.integer  "incoming_reject_no"
    t.integer  "purpose"
    t.string   "vendor_delivery_no"
    t.integer  "updated_by"
    t.integer  "purchase_requisition_item_id"
    t.integer  "returned_qty",                 :default => 0
    t.integer  "order_qty",                    :default => 0
    t.string   "job_order_no"
    t.integer  "balance_qty",                  :default => 0
    t.integer  "current_stock",                :default => 0
    t.string   "client_part_no"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.date     "ir_date"
    t.string   "sales_tax_exemption_no"
  end

  add_index "incoming_rejects", ["purchase_requisition_item_id"], :name => "index_incoming_rejects_on_purchase_requisition_item_id"

  create_table "inventory_histories", :force => true do |t|
    t.integer  "receive_note_item_id"
    t.integer  "product_id"
    t.integer  "stock_in"
    t.integer  "stock_out"
    t.integer  "inventory_issue_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "amount",               :default => 0
  end

  add_index "inventory_histories", ["product_id"], :name => "index_inventory_histories_on_product_id"
  add_index "inventory_histories", ["receive_note_item_id"], :name => "index_inventory_histories_on_purchase_requisition_item_line_id"

  create_table "inventory_issues", :force => true do |t|
    t.string   "description"
    t.string   "in_out"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "inventory_management_systems", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payment_types", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string   "code"
    t.string   "desc"
    t.integer  "parent_id",     :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "icon"
    t.boolean  "operation"
    t.integer  "more_category"
    t.boolean  "keep_in_view",  :default => false
    t.integer  "category_type"
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "trade_company_id"
    t.integer  "product_category_id"
    t.integer  "currency_id"
    t.decimal  "unit_price",          :precision => 10, :scale => 5, :default => 0.0
    t.integer  "price_in"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.string   "part_no"
  end

  add_index "product_prices", ["product_category_id"], :name => "index_product_prices_on_product_category_id"
  add_index "product_prices", ["trade_company_id"], :name => "index_product_prices_on_trade_company_id"

  create_table "product_vendors", :force => true do |t|
    t.integer  "product_id"
    t.integer  "trade_company_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.float    "unit_price",       :default => 0.0
  end

  add_index "product_vendors", ["product_id"], :name => "index_product_vendors_on_product_id"
  add_index "product_vendors", ["trade_company_id"], :name => "index_product_vendors_on_trade_company_id"

  create_table "products", :force => true do |t|
    t.string   "code"
    t.integer  "unit_measurement_id"
    t.string   "desc"
    t.string   "color_grade"
    t.string   "version"
    t.string   "model"
    t.string   "part_no"
    t.string   "tarif_code"
    t.decimal  "part_weight",            :precision => 10, :scale => 6, :default => 0.0
    t.decimal  "selling_price",          :precision => 10, :scale => 5, :default => 0.0
    t.date     "cutoff_date"
    t.integer  "opening_stock",                                         :default => 0
    t.integer  "current_stock",                                         :default => 0
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
    t.integer  "product_category_id"
    t.string   "product_name"
    t.integer  "sales_tax_exemption_id"
  end

  add_index "products", ["sales_tax_exemption_id"], :name => "index_products_on_sales_tax_exemption_id"
  add_index "products", ["unit_measurement_id"], :name => "index_purchase_order_items_on_unit_measurement_id"

  create_table "purchase_order_item_lines", :force => true do |t|
    t.integer  "purchase_requisition_item_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "purchase_order_id"
    t.boolean  "checked",                      :default => false
    t.float    "weight",                       :default => 0.0
    t.integer  "receive_note_id"
    t.integer  "received_qty",                 :default => 0
  end

  add_index "purchase_order_item_lines", ["purchase_order_id"], :name => "index_purchase_order_item_lines_on_purchase_order_id"
  add_index "purchase_order_item_lines", ["purchase_requisition_item_id"], :name => "index_purchase_order_item_lines_on_purchase_requisition_item_id"

  create_table "purchase_orders", :force => true do |t|
    t.integer  "po_no"
    t.date     "po_date"
    t.integer  "trade_company_id"
    t.integer  "purchase_by"
    t.integer  "request_by"
    t.integer  "currency_id"
    t.integer  "trade_term_id"
    t.integer  "transport_id"
    t.integer  "revision",                :default => 0
    t.integer  "tax",                     :default => 0
    t.integer  "verify"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "purchase_requisition_id"
    t.integer  "sales_tax_exemption_id"
    t.float    "kgs",                     :default => 0.0
  end

  add_index "purchase_orders", ["trade_company_id"], :name => "index_purchase_orders_on_trade_company_id"
  add_index "purchase_orders", ["trade_term_id"], :name => "index_purchase_orders_on_trade_term_id"

  create_table "purchase_requisition_items", :force => true do |t|
    t.integer  "purchase_requisition_id"
    t.integer  "product_id"
    t.integer  "trade_company_id"
    t.text     "description"
    t.integer  "quantity",                :default => 1
    t.integer  "unit_measurement_id"
    t.date     "eta"
    t.string   "purchase_order_no"
    t.float    "unit_price",              :default => 0.0
    t.float    "decimal",                 :default => 0.0
    t.text     "remark"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "status"
    t.string   "trade_company_new_name"
    t.integer  "user_id"
    t.boolean  "maintenance",             :default => false
    t.boolean  "proposed_vendor",         :default => false
    t.boolean  "approval_proposed",       :default => false
    t.string   "approval_remark"
    t.boolean  "urgent",                  :default => false
  end

  add_index "purchase_requisition_items", ["product_id"], :name => "index_purchase_requisition_items_on_product_id"
  add_index "purchase_requisition_items", ["purchase_requisition_id"], :name => "index_purchase_requisition_items_on_purchase_requisition_id"
  add_index "purchase_requisition_items", ["trade_company_id"], :name => "index_purchase_requisition_items_on_trade_company_id"
  add_index "purchase_requisition_items", ["unit_measurement_id"], :name => "index_purchase_requisition_items_on_unit_measurement_id"

  create_table "purchase_requisitions", :force => true do |t|
    t.integer  "pr_no"
    t.string   "status"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "requested_by"
    t.date     "requested_by_date"
    t.string   "approved_by_level_two"
    t.date     "approved_by_level_two_date"
    t.string   "approved_by_level_three"
    t.date     "approved_by_level_three_date"
    t.string   "approved_by_level_five"
    t.date     "approved_by_level_five_date"
    t.string   "remark"
  end

  create_table "quotation_request_forms", :force => true do |t|
    t.string   "customer_name"
    t.date     "qrf_date"
    t.string   "description"
    t.float    "internal_dimensen_length",    :default => 0.0
    t.float    "internal_dimensen_width",     :default => 0.0
    t.float    "internal_dimensen_height",    :default => 0.0
    t.float    "internal_dimensen_tolerance", :default => 0.0
    t.float    "external_dimensen_length",    :default => 0.0
    t.float    "external_dimensen_width",     :default => 0.0
    t.float    "external_dimensen_height",    :default => 0.0
    t.float    "external_dimensen_tolerance", :default => 0.0
    t.float    "open_size_length",            :default => 0.0
    t.float    "open_size_width",             :default => 0.0
    t.string   "color"
    t.string   "material"
    t.string   "finishing"
    t.string   "varnish"
    t.string   "varnish_type"
    t.string   "uv_coat"
    t.string   "calendaring_coat"
    t.string   "matt_coat"
    t.boolean  "wax"
    t.string   "lamination"
    t.boolean  "window_patching"
    t.string   "window_patching_type"
    t.string   "window_patching_type_other"
    t.string   "window_shape"
    t.string   "window_shape_other"
    t.string   "die_cut_type"
    t.string   "die_cut_type_other"
    t.boolean  "triming"
    t.boolean  "folding"
    t.integer  "collating_no"
    t.integer  "color_no"
    t.string   "color_type"
    t.integer  "quantity",                    :default => 0
    t.float    "unit_price",                  :default => 0.0
    t.string   "remarks"
    t.integer  "quotation_request_no"
    t.integer  "updated_by"
    t.integer  "authorized_by"
    t.string   "status"
    t.string   "status_remark"
    t.integer  "trade_company_id"
    t.integer  "unit_measurement_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "receive_note_items", :force => true do |t|
    t.integer  "receive_note_id"
    t.integer  "purchase_order_item_line_id"
    t.integer  "received_qty"
    t.integer  "order_qty"
    t.string   "vendor_part_no"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.float    "kgs"
  end

  create_table "receive_notes", :force => true do |t|
    t.integer  "receive_note_no"
    t.string   "vendor_delivery_no"
    t.integer  "updated_by"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "licence_no"
    t.integer  "trade_company_id"
    t.integer  "sales_tax_exemption_id"
    t.date     "rn_date"
  end

  add_index "receive_notes", ["sales_tax_exemption_id"], :name => "index_receive_notes_on_sales_tax_exemption_id"
  add_index "receive_notes", ["trade_company_id"], :name => "index_receive_notes_on_trade_company_id"

  create_table "roles", :force => true do |t|
    t.integer "user_id"
    t.integer "inventory_management_system_id"
  end

  create_table "sales_order_items", :force => true do |t|
    t.integer  "sales_order_id"
    t.integer  "product_id"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "unit_measurement_id"
    t.date     "eta"
    t.float    "unit_price"
    t.string   "status"
    t.string   "customer_po"
    t.string   "part_no"
    t.integer  "current_stock"
    t.integer  "complete_qty"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
  end

  add_index "sales_order_items", ["product_id"], :name => "index_sales_order_items_on_product_id"
  add_index "sales_order_items", ["sales_order_id"], :name => "index_sales_order_items_on_sales_order_id"
  add_index "sales_order_items", ["unit_measurement_id"], :name => "index_sales_order_items_on_unit_measurement_id"
  add_index "sales_order_items", ["user_id"], :name => "index_sales_order_items_on_user_id"

  create_table "sales_orders", :force => true do |t|
    t.integer  "sales_order_no"
    t.integer  "trade_company_id"
    t.string   "purchase_order_no"
    t.string   "sales_rep"
    t.integer  "currency_id"
    t.integer  "trade_term_id"
    t.integer  "revision"
    t.integer  "purpose"
    t.integer  "updated_by"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "sales_orders", ["currency_id"], :name => "index_sales_orders_on_currency_id"
  add_index "sales_orders", ["trade_company_id"], :name => "index_sales_orders_on_trade_company_id"
  add_index "sales_orders", ["trade_term_id"], :name => "index_sales_orders_on_trade_term_id"

  create_table "sales_tax_exemption_items", :force => true do |t|
    t.integer  "sales_tax_exemption_id"
    t.integer  "product_id"
    t.float    "remaining_total"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "receive_note_item_id"
    t.float    "kgs"
    t.integer  "purchase_order_id"
  end

  create_table "sales_tax_exemptions", :force => true do |t|
    t.integer  "ste_no"
    t.string   "sales_tax_exemption_no"
    t.integer  "trade_company_id"
    t.date     "period_start"
    t.date     "period_end"
    t.string   "tarif_code"
    t.float    "apply_qty",              :default => 0.0
    t.float    "complete_qty",           :default => 0.0
    t.integer  "unit_measurement_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "valid_condition",        :default => false
    t.float    "remaining_total"
    t.string   "perihal_barang"
    t.string   "registration_no"
  end

  create_table "selection_die_cuts", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_die_cuts", ["quotation_request_form_id"], :name => "index_selection_die_cuts_on_quotation_request_form_id"

  create_table "selection_glueings", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "glueing"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_glueings", ["quotation_request_form_id"], :name => "index_selection_glueings_on_quotation_request_form_id"

  create_table "sequents", :force => true do |t|
    t.string   "sequent_color"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "sequents", ["quotation_request_form_id"], :name => "index_sequents_on_quotation_request_form_id"

  create_table "settings", :force => true do |t|
    t.string   "backup_path"
    t.string   "version",     :limit => 45
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "source_path"
  end

  create_table "temporary_sources", :force => true do |t|
    t.string   "company_name"
    t.boolean  "select_vendor",                                              :default => false
    t.decimal  "unit_price",                   :precision => 8, :scale => 4, :default => 0.0
    t.string   "remark"
    t.datetime "created_at",                                                                    :null => false
    t.datetime "updated_at",                                                                    :null => false
    t.integer  "purchase_requisition_item_id"
  end

  add_index "temporary_sources", ["purchase_requisition_item_id"], :name => "index_temporary_sources_on_purchase_requisition_item_id"

  create_table "temporary_tarif_codes", :force => true do |t|
    t.string "tarif_code"
    t.float  "remaining_total"
  end

  create_table "trade_companies", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "tel_no_1"
    t.string   "tel_no_2"
    t.string   "fax_no"
    t.string   "contact_person"
    t.integer  "type_of_sale_id"
    t.string   "sales_tax_no"
    t.integer  "sales_tax_exemption_id",                                  :default => 0
    t.string   "sales_rep"
    t.integer  "trade_term_id"
    t.integer  "status"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.integer  "customer_approval",                                       :default => 0
    t.string   "company_reg_no"
    t.integer  "payment_type_id"
    t.date     "opening_ac_date"
    t.decimal  "opening_ac_amount",        :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "limit_amount",             :precision => 10, :scale => 2, :default => 0.0
    t.string   "email"
    t.string   "user_type"
    t.string   "sales_tax_licence_no"
    t.string   "warehouse_licence_no"
    t.string   "mfg_warehouse_licence_no"
    t.string   "banking_name"
    t.string   "banking_account"
  end

  add_index "trade_companies", ["trade_term_id"], :name => "index_trade_companies_on_trade_term_id"
  add_index "trade_companies", ["type_of_sale_id"], :name => "index_trade_companies_on_type_of_sale_id"

  create_table "trade_terms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_sales", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "unit_measurements", :force => true do |t|
    t.string   "code"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "department_id"
    t.integer  "level"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["department_id"], :name => "index_users_on_department_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
