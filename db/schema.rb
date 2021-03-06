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

ActiveRecord::Schema.define(:version => 20130720024928) do

  create_table "boms", :force => true do |t|
    t.integer  "status"
    t.integer  "quotation_request_form_id"
    t.string   "customer_po_no"
    t.integer  "prepared_by"
    t.string   "paper"
    t.string   "original_size"
    t.string   "trim_size"
    t.integer  "ratio"
    t.integer  "paper_product_id"
    t.text     "packing_qty"
    t.text     "mould_no"
    t.string   "ecn"
    t.text     "finishing"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "boms", ["quotation_request_form_id"], :name => "index_boms_on_quotation_request_form_id"

  create_table "change_company_codes", :force => true do |t|
    t.string   "old_code"
    t.string   "new_code"
    t.integer  "trade_company_id"
    t.string   "remark"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "change_company_codes", ["trade_company_id"], :name => "index_change_company_codes_on_trade_company_id"

  create_table "colors", :force => true do |t|
    t.string   "color_code"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "color_name"
  end

  add_index "colors", ["quotation_request_form_id"], :name => "index_colors_on_quotation_request_form_id"

  create_table "company_profiles", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "tel_no_1"
    t.string   "tel_no_2"
    t.string   "fax_no"
    t.string   "sales_tax_no"
    t.string   "reg_no"
    t.integer  "sn_sales_order_no",                                        :default => 0
    t.integer  "sn_purchase_order_no",                                     :default => 0
    t.integer  "sn_deliver_order_no",                                      :default => 0
    t.integer  "sn_receive_note_no",                                       :default => 0
    t.integer  "sn_transfer_slip_no",                                      :default => 0
    t.integer  "sn_store_voucher_no",                                      :default => 0
    t.integer  "sn_incoming_reject_no",                                    :default => 0
    t.integer  "sn_outgoing_reject_no",                                    :default => 0
    t.integer  "sn_credit_note_no",                                        :default => 0
    t.integer  "sn_debit_note_no",                                         :default => 0
    t.integer  "sn_billing_order_no",                                      :default => 0
    t.integer  "sn_purchase_req_no",                                       :default => 0
    t.integer  "sn_product_price_no",                                      :default => 0
    t.integer  "sn_job_order_no",                                          :default => 0
    t.integer  "sn_shipment_schedule",                                     :default => 0
    t.integer  "sn_scrap_sheet_no",                                        :default => 0
    t.integer  "sn_receiving_instr_no",                                    :default => 0
    t.integer  "sn_shipping_instr_no",                                     :default => 0
    t.integer  "sn_receipt_no",                                            :default => 0
    t.integer  "sn_bankin_slip_no",                                        :default => 0
    t.integer  "sn_journal_voucher_no",                                    :default => 0
    t.integer  "sn_payment_voucher_no",                                    :default => 0
    t.datetime "created_at",                                                                         :null => false
    t.datetime "updated_at",                                                                         :null => false
    t.integer  "sn_product_id_no"
    t.integer  "sn_sales_tax_exemption_no",                                :default => 0
    t.integer  "sn_quotation_request_no",                                  :default => 0
    t.integer  "sn_bom_no",                                                :default => 0
    t.decimal  "total_amount",              :precision => 10, :scale => 2, :default => 0.0
    t.date     "check_expire_date",                                        :default => '2013-07-02'
  end

  create_table "contacts", :force => true do |t|
    t.integer  "trade_company_id"
    t.string   "department"
    t.string   "name"
    t.string   "phone_area_code"
    t.string   "phone_no"
    t.string   "mobile_area_code"
    t.string   "mobile_no"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contacts", ["trade_company_id"], :name => "index_contacts_on_trade_company_id"

  create_table "costing_sheet_changelogs", :force => true do |t|
    t.integer  "costing_sheet_id"
    t.string   "change_log"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "costing_sheet_changelogs", ["costing_sheet_id"], :name => "index_costing_sheet_changelogs_on_costing_sheet_id"

  create_table "costing_sheet_formulations", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "formulation"
    t.string   "status",      :default => "A"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "costing_sheets", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "prod_size"
    t.string   "open_size"
    t.integer  "quantity",                  :default => 0
    t.integer  "color",                     :default => 0
    t.float    "paper_size_l",              :default => 0.0
    t.float    "paper_size_w",              :default => 0.0
    t.integer  "ratio",                     :default => 0
    t.float    "printing_size_l",           :default => 0.0
    t.float    "printing_size_w",           :default => 0.0
    t.integer  "ups",                       :default => 0
    t.integer  "art_card",                  :default => 0
    t.float    "rej_percent",               :default => 0.0
    t.float    "cost_lb",                   :default => 0.0
    t.float    "art_card_pc",               :default => 0.0
    t.float    "material_cost_usage",       :default => 0.0
    t.float    "material_cost_rej",         :default => 0.0
    t.float    "material_cost_lot",         :default => 0.0
    t.float    "material_cost_pc",          :default => 0.0
    t.integer  "printing_cost",             :default => 0
    t.string   "printing_cost_mc"
    t.float    "printing_cost_k",           :default => 0.0
    t.float    "printing_cost_r",           :default => 0.0
    t.float    "printing_cost_lot",         :default => 0.0
    t.float    "printing_cost_pc",          :default => 0.0
    t.integer  "pre_press",                 :default => 0
    t.float    "pre_press_sq",              :default => 0.0
    t.float    "pre_press_l",               :default => 0.0
    t.float    "pre_press_w",               :default => 0.0
    t.float    "pre_press_lot",             :default => 0.0
    t.float    "pre_press_pc",              :default => 0.0
    t.float    "plate_sq",                  :default => 0.0
    t.float    "plate_l",                   :default => 0.0
    t.float    "plate_w",                   :default => 0.0
    t.float    "plate_lot",                 :default => 0.0
    t.float    "plate_pc",                  :default => 0.0
    t.float    "uv_k",                      :default => 0.0
    t.float    "uv_r",                      :default => 0.0
    t.float    "uv_lot",                    :default => 0.0
    t.float    "uv_pc",                     :default => 0.0
    t.string   "lamination_remark"
    t.float    "lamination_k",              :default => 0.0
    t.float    "lamination_r",              :default => 0.0
    t.float    "lamination_lot",            :default => 0.0
    t.float    "lamination_pc",             :default => 0.0
    t.float    "die_cut_lot",               :default => 0.0
    t.float    "die_cut_pc",                :default => 0.0
    t.float    "die_cut_labour_k",          :default => 0.0
    t.float    "die_cut_labour_r",          :default => 0.0
    t.float    "die_cut_labour_lot",        :default => 0.0
    t.float    "die_cut_labour_pc",         :default => 0.0
    t.string   "glueing_remark"
    t.float    "glueing_k",                 :default => 0.0
    t.float    "glueing_r",                 :default => 0.0
    t.float    "glueing_lot",               :default => 0.0
    t.float    "glueing_pc",                :default => 0.0
    t.string   "gold_remark"
    t.float    "gold_k",                    :default => 0.0
    t.float    "gold_r",                    :default => 0.0
    t.float    "gold_lot",                  :default => 0.0
    t.float    "gold_pc",                   :default => 0.0
    t.float    "packing_cost",              :default => 0.0
    t.float    "packing_cost_r",            :default => 0.0
    t.float    "packing_lot",               :default => 0.0
    t.float    "packing_pc",                :default => 0.0
    t.float    "transport",                 :default => 0.0
    t.float    "transport_r",               :default => 0.0
    t.float    "transport_lot",             :default => 0.0
    t.float    "transport_pc",              :default => 0.0
    t.float    "misc_r",                    :default => 0.0
    t.float    "misc_lot",                  :default => 0.0
    t.float    "misc_pc",                   :default => 0.0
    t.float    "raw_material_percent",      :default => 0.0
    t.float    "paper_mt",                  :default => 0.0
    t.float    "total_lot",                 :default => 0.0
    t.float    "total_pc",                  :default => 0.0
    t.float    "admin_percent",             :default => 0.0
    t.float    "admin_lot",                 :default => 0.0
    t.float    "admin_pc",                  :default => 0.0
    t.float    "grand_total_lot",           :default => 0.0
    t.float    "grand_total_pc",            :default => 0.0
    t.float    "summary_percent",           :default => 0.0
    t.float    "summary_lot",               :default => 0.0
    t.float    "summary_pc",                :default => 0.0
    t.text     "remark"
    t.date     "costing_sheet_date"
    t.string   "status",                    :default => "A"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "costing_sheets", ["quotation_request_form_id"], :name => "index_costing_sheets_on_quotation_request_form_id"

  create_table "credit_notes", :force => true do |t|
    t.string   "credit_note_no"
    t.date     "credit_note_date"
    t.integer  "trade_company_id"
    t.integer  "currency_id"
    t.string   "credit_type"
    t.integer  "updated_by"
    t.decimal  "amount",           :precision => 10, :scale => 2, :default => 0.0
    t.integer  "status_id",                                       :default => 1
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.text     "remark"
  end

  add_index "credit_notes", ["currency_id"], :name => "index_credit_notes_on_currency_id"
  add_index "credit_notes", ["trade_company_id"], :name => "index_credit_notes_on_trade_company_id"

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "status",      :default => "ACTIVE"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "description"
  end

  create_table "custom_productions", :force => true do |t|
    t.string   "lot_size"
    t.string   "part_no"
    t.string   "category_no"
    t.string   "stock_reference"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "custom_productions", ["quotation_request_form_id"], :name => "index_custom_productions_on_quotation_request_form_id"

  create_table "debit_notes", :force => true do |t|
    t.string   "debit_note_no"
    t.date     "debit_note_date"
    t.integer  "trade_company_id"
    t.string   "debit_type"
    t.integer  "currency_id"
    t.integer  "updated_by"
    t.decimal  "amount",           :precision => 10, :scale => 2, :default => 0.0
    t.integer  "status_id",                                       :default => 1
    t.integer  "account_id"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.text     "remark"
  end

  add_index "debit_notes", ["currency_id"], :name => "index_debit_notes_on_currency_id"
  add_index "debit_notes", ["trade_company_id"], :name => "index_debit_notes_on_trade_company_id"

  create_table "delivery_order_items", :force => true do |t|
    t.integer  "sales_order_item_id"
    t.date     "so_date"
    t.integer  "delivery_qty",        :default => 0
    t.integer  "order_qty",           :default => 0
    t.float    "unit_price",          :default => 0.0
    t.integer  "balance_qty",         :default => 0
    t.integer  "no_of_carton"
    t.integer  "gen_current_stock"
    t.integer  "do_status",           :default => 601
    t.string   "part_no"
    t.string   "client_lot"
    t.string   "client_po"
    t.string   "department"
    t.integer  "dept_current_stock"
    t.integer  "delivery_order_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "delivery_order_items", ["delivery_order_id"], :name => "index_delivery_order_items_on_delivery_order_id"
  add_index "delivery_order_items", ["sales_order_item_id"], :name => "index_delivery_order_items_on_sales_order_item_id"

  create_table "delivery_orders", :force => true do |t|
    t.integer  "do_no"
    t.integer  "trade_company_id"
    t.integer  "sales_tax",                                             :default => 0
    t.integer  "type_of_sale_id"
    t.decimal  "tport_c",                :precision => 10, :scale => 2, :default => 0.0
    t.integer  "currency_id"
    t.integer  "bk_two"
    t.integer  "trade_term_id"
    t.integer  "updated_by"
    t.integer  "transport_id"
    t.string   "sales_rep"
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
    t.date     "do_date"
    t.string   "status",                                                :default => "Active"
    t.boolean  "authorize_print",                                       :default => false
    t.integer  "sales_tax_exemption_id"
  end

  add_index "delivery_orders", ["currency_id"], :name => "index_delivery_orders_on_currency_id"
  add_index "delivery_orders", ["trade_company_id"], :name => "index_delivery_orders_on_trade_company_id"
  add_index "delivery_orders", ["trade_term_id"], :name => "index_delivery_orders_on_trade_term_id"
  add_index "delivery_orders", ["transport_id"], :name => "index_delivery_orders_on_transport_id"
  add_index "delivery_orders", ["type_of_sale_id"], :name => "index_delivery_orders_on_type_of_sales_id"

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "status",       :default => "ACTIVE"
    t.string   "shotcut_name"
  end

  create_table "film_numbers", :force => true do |t|
    t.string   "color_name"
    t.string   "color_code"
    t.string   "bom_size"
    t.date     "film_date"
    t.integer  "bom_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "film_numbers", ["bom_id"], :name => "index_film_numbers_on_bom_id"

  create_table "formulations", :force => true do |t|
    t.float    "per_value",                :default => 0.0
    t.integer  "from_unit_measurement_id"
    t.float    "convert_value",            :default => 0.0
    t.integer  "to_unit_measurement_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "status",                   :default => 1
  end

  create_table "history_invoices", :force => true do |t|
    t.integer  "delivery_order_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.date     "created_date"
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
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "amount",               :default => 0
    t.string   "status",               :default => "ACTIVE"
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

  create_table "job_sheets", :force => true do |t|
    t.string   "customer_name"
    t.date     "qrf_date"
    t.float    "open_size_length",         :default => 0.0
    t.float    "open_size_width",          :default => 0.0
    t.integer  "collating_no"
    t.integer  "quotation_request_no"
    t.integer  "updated_by"
    t.integer  "authorized_by"
    t.string   "status",                   :default => "1"
    t.string   "option_size"
    t.float    "window_width",             :default => 0.0
    t.float    "window_length",            :default => 0.0
    t.integer  "window_usage",             :default => 0
    t.integer  "no_of_moq",                :default => 0
    t.string   "barcode"
    t.string   "barcode_other"
    t.string   "shortage"
    t.string   "pre_print_textbox"
    t.string   "packing_type"
    t.string   "packing_type_other"
    t.integer  "packed_quantity",          :default => 0
    t.string   "collect_sequence"
    t.string   "custom_stock_code"
    t.string   "box_part_no"
    t.integer  "lot_size_no"
    t.string   "rev",                      :default => "00"
    t.date     "job_sheet_date"
    t.string   "job_no"
    t.string   "customer_po_no"
    t.integer  "trade_company_id"
    t.date     "eta"
    t.string   "description"
    t.string   "issue_note"
    t.string   "requested_by"
    t.integer  "requested_qty",            :default => 0
    t.float    "internal_dimensen_length", :default => 0.0
    t.float    "internal_dimensen_width",  :default => 0.0
    t.float    "internal_dimensen_height", :default => 0.0
    t.integer  "size_xs_qty",              :default => 0
    t.integer  "size_s_qty",               :default => 0
    t.integer  "size_m_qty",               :default => 0
    t.integer  "size_l_qty",               :default => 0
    t.integer  "size_xl_qty",              :default => 0
    t.integer  "size_xxl_qty",             :default => 0
    t.integer  "printing_xs_qty",          :default => 0
    t.integer  "printing_s_qty",           :default => 0
    t.integer  "printing_m_qty",           :default => 0
    t.integer  "printing_l_qty",           :default => 0
    t.integer  "printing_xl_qty",          :default => 0
    t.integer  "printing_xxl_qty",         :default => 0
    t.string   "uv"
    t.string   "varnish"
    t.string   "lamination"
    t.string   "die_cut"
    t.string   "glueing"
    t.string   "window"
    t.string   "wax"
    t.string   "finishing_other"
    t.string   "matt_varnish"
    t.text     "ink"
    t.integer  "material_gramme",          :default => 0
    t.integer  "unit_measurement_id"
    t.string   "material_type"
    t.float    "paper_width",              :default => 0.0
    t.float    "paper_length",             :default => 0.0
    t.text     "trim_size"
    t.integer  "ratio",                    :default => 0
    t.integer  "ori_size_qty",             :default => 0
    t.text     "remarks"
    t.integer  "stock_xs_qty",             :default => 0
    t.integer  "stock_s_qty",              :default => 0
    t.integer  "stock_m_qty",              :default => 0
    t.integer  "stock_l_qty",              :default => 0
    t.integer  "stock_xl_qty",             :default => 0
    t.integer  "stock_xxl_qty",            :default => 0
    t.text     "customer_ref"
    t.string   "packing_qty"
    t.text     "mould_no"
    t.string   "prepared_by"
    t.integer  "sales_order_id"
    t.text     "film_no"
    t.text     "wef"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "job_sheets", ["sales_order_id"], :name => "index_job_sheets_on_sales_order_id"
  add_index "job_sheets", ["trade_company_id"], :name => "index_job_sheets_on_trade_company_id"
  add_index "job_sheets", ["unit_measurement_id"], :name => "index_job_sheets_on_unit_measurement_id"

  create_table "journal_voucher_items", :force => true do |t|
    t.string   "document_type"
    t.integer  "document_no"
    t.date     "document_date"
    t.decimal  "document_amount",    :precision => 10, :scale => 4, :default => 0.0
    t.decimal  "balance_amount",     :precision => 10, :scale => 4, :default => 0.0
    t.integer  "fp"
    t.decimal  "os_amount",          :precision => 10, :scale => 4, :default => 0.0
    t.integer  "journal_voucher_id"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

  add_index "journal_voucher_items", ["journal_voucher_id"], :name => "index_journal_voucher_items_on_journal_voucher_id"

  create_table "journal_vouchers", :force => true do |t|
    t.integer  "jv_no"
    t.date     "jv_date"
    t.integer  "trade_company_id"
    t.string   "particular"
    t.decimal  "debit_amount",     :precision => 10, :scale => 4, :default => 0.0
    t.decimal  "credit_amount",    :precision => 10, :scale => 4, :default => 0.0
    t.integer  "updated_by"
    t.integer  "status_id",                                       :default => 1
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  add_index "journal_vouchers", ["trade_company_id"], :name => "index_journal_vouchers_on_trade_company_id"

  create_table "material_of_quantities", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.integer  "quantity"
    t.float    "unit_price"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "material_of_quantities", ["quotation_request_form_id"], :name => "index_material_of_quantities_on_quotation_request_form_id"

  create_table "outgoing_reject_items", :force => true do |t|
    t.integer  "quantity"
    t.integer  "received_qty"
    t.integer  "invoice_delivery_qty"
    t.float    "invoice_unit_price",     :default => 0.0
    t.integer  "so_balance_qty"
    t.integer  "status",                 :default => 1
    t.integer  "current_stock"
    t.string   "client_lot"
    t.string   "client_part"
    t.string   "client_po"
    t.integer  "sales_order_item_id"
    t.integer  "outgoing_reject_id"
    t.integer  "delivery_order_item_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "outgoing_rejects", :force => true do |t|
    t.integer  "outgoing_reject_no"
    t.date     "outgoing_date",                                     :default => '2013-07-06'
    t.integer  "trade_company_id"
    t.decimal  "sales_tax",          :precision => 10, :scale => 2, :default => 0.0
    t.integer  "currency_id"
    t.integer  "trade_term_id"
    t.integer  "return_note_no"
    t.integer  "updated_by"
    t.integer  "delivery_order_id"
    t.integer  "status",                                            :default => 1
    t.integer  "delivery_order_no"
    t.text     "remark"
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
  end

  add_index "outgoing_rejects", ["currency_id"], :name => "index_outgoing_rejects_on_currency_id"
  add_index "outgoing_rejects", ["delivery_order_id"], :name => "index_outgoing_rejects_on_delivery_order_id"
  add_index "outgoing_rejects", ["trade_company_id"], :name => "index_outgoing_rejects_on_trade_company_id"
  add_index "outgoing_rejects", ["trade_term_id"], :name => "index_outgoing_rejects_on_trade_term_id"

  create_table "packing_quantities", :force => true do |t|
    t.float   "quantity",     :default => 0.0
    t.string  "packing_type"
    t.integer "product_id"
  end

  add_index "packing_quantities", ["product_id"], :name => "index_packing_quantities_on_product_id"

  create_table "payment_receiveds", :force => true do |t|
    t.integer  "trade_company_id"
    t.date     "payment_date"
    t.string   "bank"
    t.string   "place"
    t.string   "cheque_no"
    t.date     "cheque_date"
    t.decimal  "cheque_amount",      :precision => 10, :scale => 2, :default => 0.0
    t.boolean  "outport_cheque",                                    :default => false
    t.boolean  "third_party_cheque",                                :default => false
    t.integer  "status_id",                                         :default => 1
    t.integer  "updated_by"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
  end

  add_index "payment_receiveds", ["trade_company_id"], :name => "index_payment_receiveds_on_trade_company_id"

  create_table "payment_types", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pre_print_types", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "pre_print"
    t.string   "other"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "pre_print_types", ["quotation_request_form_id"], :name => "index_pre_print_types_on_quotation_request_form_id"

  create_table "price_control_items", :force => true do |t|
    t.integer  "product_id"
    t.float    "old_unit_price",   :default => 0.0
    t.date     "old_eff_date"
    t.float    "new_unit_price",   :default => 0.0
    t.date     "new_eff_date"
    t.string   "part_no"
    t.string   "status",           :default => "Active"
    t.integer  "user_id"
    t.integer  "price_control_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "price_control_items", ["price_control_id"], :name => "index_price_control_items_on_price_control_id"
  add_index "price_control_items", ["product_id"], :name => "index_price_control_items_on_product_id"
  add_index "price_control_items", ["user_id"], :name => "index_price_control_items_on_user_id"

  create_table "price_controls", :force => true do |t|
    t.string   "pp_no"
    t.date     "pp_date"
    t.integer  "trade_company_id"
    t.string   "reference"
    t.integer  "currency_id"
    t.integer  "user_id"
    t.string   "status",           :default => "Active"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "price_controls", ["currency_id"], :name => "index_price_controls_on_currency_id"
  add_index "price_controls", ["trade_company_id"], :name => "index_price_controls_on_trade_company_id"
  add_index "price_controls", ["user_id"], :name => "index_price_controls_on_user_id"

  create_table "product_categories", :force => true do |t|
    t.string   "code"
    t.string   "desc"
    t.integer  "parent_id",         :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "icon"
    t.integer  "category_type"
    t.string   "status",            :default => "Active"
    t.boolean  "exist_field",       :default => false
    t.integer  "refer_category_id"
    t.integer  "level",             :default => 0
    t.boolean  "open_product_id",   :default => false
    t.boolean  "active_common",     :default => false
  end

  create_table "product_comboboxes", :force => true do |t|
    t.integer  "product_id"
    t.string   "product_code"
    t.string   "status",           :default => "Active"
    t.integer  "category_type"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "old_product_code"
  end

  add_index "product_comboboxes", ["product_id"], :name => "index_product_comboboxes_on_product_id"

  create_table "product_customers", :force => true do |t|
    t.integer  "product_id"
    t.integer  "trade_company_id"
    t.float    "selling_price",    :default => 0.0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.date     "eff_date"
    t.integer  "currency_id"
  end

  add_index "product_customers", ["product_id"], :name => "index_product_customers_on_product_id"
  add_index "product_customers", ["trade_company_id"], :name => "index_product_customers_on_trade_company_id"

  create_table "product_fields", :force => true do |t|
    t.integer  "category_id"
    t.integer  "field_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_running_numbers", :force => true do |t|
    t.string   "base_name"
    t.string   "sub_name"
    t.integer  "running_no",          :default => 0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "product_category_id"
  end

  add_index "product_running_numbers", ["product_category_id"], :name => "index_product_running_numbers_on_product_category_id"

  create_table "product_vendors", :force => true do |t|
    t.integer  "product_id"
    t.integer  "trade_company_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.float    "unit_price",       :default => 0.0
    t.integer  "currency_id"
  end

  add_index "product_vendors", ["product_id"], :name => "index_product_vendors_on_product_id"
  add_index "product_vendors", ["trade_company_id"], :name => "index_product_vendors_on_trade_company_id"

  create_table "products", :force => true do |t|
    t.string   "code"
    t.integer  "unit_measurement_id"
    t.string   "desc"
    t.string   "tarif_code"
    t.decimal  "part_weight",                   :precision => 10, :scale => 6, :default => 0.0
    t.date     "cutoff_date"
    t.integer  "opening_stock",                                                :default => 0
    t.integer  "current_stock",                                                :default => 0
    t.datetime "created_at",                                                                         :null => false
    t.datetime "updated_at",                                                                         :null => false
    t.integer  "product_category_id"
    t.string   "product_name"
    t.integer  "sales_tax_exemption_id"
    t.string   "status",                                                       :default => "Active"
    t.integer  "gsm",                                                          :default => 0
    t.float    "width",                                                        :default => 0.0
    t.string   "width_um"
    t.float    "length",                                                       :default => 0.0
    t.string   "length_um"
    t.float    "height",                                                       :default => 0.0
    t.string   "height_um"
    t.float    "tickness",                                                     :default => 0.0
    t.string   "tickness_um"
    t.string   "origin"
    t.string   "brand"
    t.string   "grade"
    t.string   "packing_method"
    t.float    "packing_qty",                                                  :default => 0.0
    t.string   "container_no"
    t.string   "seal_no"
    t.string   "despatch_advise"
    t.string   "size"
    t.string   "model_no"
    t.string   "reorder_no"
    t.string   "art_no"
    t.string   "ref_no"
    t.string   "work_order_no"
    t.date     "mfg_date"
    t.date     "exp_date"
    t.string   "film_no"
    t.string   "bar_code"
    t.string   "lot_no"
    t.string   "item_code"
    t.string   "part_code"
    t.string   "pantone_code"
    t.string   "color"
    t.string   "serial_no"
    t.string   "warranty"
    t.string   "capacity"
    t.float    "diameter",                                                     :default => 0.0
    t.integer  "voltage",                                                      :default => 0
    t.integer  "watt",                                                         :default => 0
    t.integer  "pin",                                                          :default => 0
    t.integer  "ampere",                                                       :default => 0
    t.float    "hp",                                                           :default => 0.0
    t.float    "hz",                                                           :default => 0.0
    t.float    "pureness",                                                     :default => 0.0
    t.float    "ton",                                                          :default => 0.0
    t.string   "consignee"
    t.string   "destination"
    t.string   "process"
    t.integer  "buffer_stock"
    t.string   "mould_no"
    t.integer  "sales_tax_exemption_barang_id"
    t.string   "category"
    t.string   "window_code"
    t.string   "revision"
    t.integer  "copied_no",                                                    :default => 0
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
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "purchase_requisition_id"
    t.integer  "sales_tax_exemption_id"
    t.float    "kgs",                     :default => 0.0
    t.string   "status",                  :default => "ACTIVE"
    t.string   "remark"
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
    t.string   "trade_company_new_name"
    t.integer  "user_id"
    t.boolean  "maintenance",             :default => false
    t.boolean  "proposed_vendor",         :default => false
    t.boolean  "approval_proposed",       :default => false
    t.string   "approval_remark"
    t.boolean  "urgent",                  :default => false
    t.string   "status"
    t.boolean  "skip_to_purchase_order",  :default => false
  end

  add_index "purchase_requisition_items", ["product_id"], :name => "index_purchase_requisition_items_on_product_id"
  add_index "purchase_requisition_items", ["purchase_requisition_id"], :name => "index_purchase_requisition_items_on_purchase_requisition_id"
  add_index "purchase_requisition_items", ["trade_company_id"], :name => "index_purchase_requisition_items_on_trade_company_id"
  add_index "purchase_requisition_items", ["unit_measurement_id"], :name => "index_purchase_requisition_items_on_unit_measurement_id"

  create_table "purchase_requisitions", :force => true do |t|
    t.integer  "pr_no"
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
    t.integer  "tasks"
    t.string   "status"
    t.string   "recover_status"
    t.integer  "department_id"
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
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "material_type"
    t.integer  "material_gramme",             :default => 0
    t.string   "material_remark"
    t.string   "surface_remark"
    t.string   "lamination_remark"
    t.float    "paper_width",                 :default => 0.0
    t.float    "paper_length",                :default => 0.0
    t.integer  "paper_no_of_ups",             :default => 0
    t.string   "option_size"
    t.integer  "ratio",                       :default => 0
    t.float    "window_width",                :default => 0.0
    t.float    "window_length",               :default => 0.0
    t.integer  "window_usage",                :default => 0
    t.integer  "no_of_moq",                   :default => 0
    t.string   "barcode"
    t.string   "barcode_other"
    t.string   "shortage"
    t.string   "pre_print_textbox"
    t.string   "glueing_material"
    t.string   "stamping_per_box"
    t.string   "lamination_type"
    t.integer  "lamination_type_joints",      :default => 0
    t.string   "flute_type"
    t.string   "flute_type_other"
    t.string   "flute_material"
    t.string   "flute_material_other"
    t.string   "packing_type"
    t.string   "packing_type_other"
    t.integer  "packed_quantity",             :default => 0
    t.string   "collect_sequence"
    t.integer  "user_id"
    t.string   "custom_stock_code"
    t.string   "box_part_no"
    t.integer  "lot_size_no"
    t.integer  "qr_task"
    t.string   "qr_status"
    t.boolean  "director_approved",           :default => false
    t.integer  "send_count",                  :default => 0
    t.integer  "confirmed_by"
    t.string   "customer_code"
    t.string   "customer_po_no"
    t.string   "recover_status"
  end

  create_table "receipt_items", :force => true do |t|
    t.integer  "receipt_type"
    t.string   "document_no"
    t.date     "document_date"
    t.decimal  "document_amount", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "balance_amount",  :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "os_amount",       :precision => 10, :scale => 2, :default => 0.0
    t.string   "fp",                                             :default => "F"
    t.integer  "receipt_id"
    t.integer  "status_id",                                      :default => 1
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  add_index "receipt_items", ["receipt_id"], :name => "index_receipt_items_on_receipt_id"

  create_table "receipt_statement_lines", :force => true do |t|
    t.integer  "receipt_id"
    t.integer  "statement_of_account_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "receipt_statement_lines", ["receipt_id"], :name => "index_receipt_statement_lines_on_receipt_id"
  add_index "receipt_statement_lines", ["statement_of_account_id"], :name => "index_receipt_statement_lines_on_statement_of_account_id"

  create_table "receipts", :force => true do |t|
    t.string   "receipt_no"
    t.date     "receipt_date"
    t.integer  "trade_company_id"
    t.decimal  "cash_amount",         :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "cheque_amount",       :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "total_amount",        :precision => 10, :scale => 2, :default => 0.0
    t.string   "journal_voucher_no"
    t.string   "remark"
    t.integer  "updated_by"
    t.integer  "status_id",                                          :default => 1
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.integer  "payment_received_id"
    t.date     "payment_date"
    t.string   "bank"
    t.string   "place"
    t.string   "cheque_no"
    t.date     "cheque_date"
    t.boolean  "outport_cheque",                                     :default => false
    t.boolean  "third_party_cheque",                                 :default => false
  end

  add_index "receipts", ["payment_received_id"], :name => "index_receipts_on_payment_received_id"
  add_index "receipts", ["trade_company_id"], :name => "index_receipts_on_trade_company_id"

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
    t.integer  "quantity"
    t.integer  "unit_measurement_id"
    t.date     "eta"
    t.float    "unit_price"
    t.string   "status"
    t.string   "customer_po"
    t.string   "part_no"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "remaining_qty",       :default => 0
    t.string   "lot_no"
    t.string   "mfg_date"
    t.string   "exp_date"
  end

  add_index "sales_order_items", ["product_id"], :name => "index_sales_order_items_on_product_id"
  add_index "sales_order_items", ["sales_order_id"], :name => "index_sales_order_items_on_sales_order_id"
  add_index "sales_order_items", ["unit_measurement_id"], :name => "index_sales_order_items_on_unit_measurement_id"

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
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.date     "so_date"
    t.string   "status",            :default => "Active"
  end

  add_index "sales_orders", ["currency_id"], :name => "index_sales_orders_on_currency_id"
  add_index "sales_orders", ["trade_company_id"], :name => "index_sales_orders_on_trade_company_id"
  add_index "sales_orders", ["trade_term_id"], :name => "index_sales_orders_on_trade_term_id"

  create_table "sales_tax_exemption_barangs", :force => true do |t|
    t.integer  "sales_tax_exemption_id"
    t.string   "perihal_barang"
    t.float    "apply_qty",              :default => 0.0
    t.float    "convert_apply_qty",      :default => 0.0
    t.float    "complete_qty",           :default => 0.0
    t.integer  "unit_measurement_id"
    t.string   "tarif_code"
    t.boolean  "valid_weight_condition", :default => true
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.float    "available_qty",          :default => 0.0
    t.integer  "calculate_um_id"
    t.boolean  "need_part_weight",       :default => false
  end

  add_index "sales_tax_exemption_barangs", ["sales_tax_exemption_id"], :name => "index_sales_tax_exemption_barangs_on_sales_tax_exemption_id"
  add_index "sales_tax_exemption_barangs", ["unit_measurement_id"], :name => "index_sales_tax_exemption_barangs_on_unit_measurement_id"

  create_table "sales_tax_exemption_lines", :force => true do |t|
    t.integer  "sales_tax_exemption_id"
    t.integer  "trade_company_id"
    t.boolean  "validate_condition",     :default => true
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "sales_tax_exemption_lines", ["sales_tax_exemption_id"], :name => "index_sales_tax_exemption_lines_on_sales_tax_exemption_id"
  add_index "sales_tax_exemption_lines", ["trade_company_id"], :name => "index_sales_tax_exemption_lines_on_trade_company_id"

  create_table "sales_tax_exemptions", :force => true do |t|
    t.integer  "running_no"
    t.string   "sales_tax_exemption_no"
    t.integer  "trade_company_id"
    t.date     "period_start"
    t.date     "period_end"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "valid_date_condition",   :default => true
    t.string   "registration_no"
    t.string   "status",                 :default => "ACTIVE"
    t.string   "type_of_exemption"
    t.string   "company_type"
  end

  create_table "selection_die_cut_moulds", :force => true do |t|
    t.string   "mould_no"
    t.string   "window_no"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_die_cut_moulds", ["quotation_request_form_id"], :name => "index_selection_die_cut_moulds_on_quotation_request_form_id"

  create_table "selection_die_cuts", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_die_cuts", ["quotation_request_form_id"], :name => "index_selection_die_cuts_on_quotation_request_form_id"

  create_table "selection_fieldsets", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.integer  "select_no"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_fieldsets", ["quotation_request_form_id"], :name => "index_selection_fieldsets_on_quotation_request_form_id"

  create_table "selection_flute_sizes", :force => true do |t|
    t.float    "flute_width"
    t.float    "flute_length"
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "selection_glueings", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "glueing"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "glueing_other"
  end

  add_index "selection_glueings", ["quotation_request_form_id"], :name => "index_selection_glueings_on_quotation_request_form_id"

  create_table "selection_printing_sizes", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.float    "length",                    :default => 0.0
    t.float    "width",                     :default => 0.0
    t.integer  "ups",                       :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "selection_printing_sizes", ["quotation_request_form_id"], :name => "index_selection_printing_sizes_on_quotation_request_form_id"

  create_table "selection_stamping_sizes", :force => true do |t|
    t.float    "stamping_width",            :default => 0.0
    t.float    "stamping_length",           :default => 0.0
    t.integer  "quotation_request_form_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "selection_stamping_sizes", ["quotation_request_form_id"], :name => "index_selection_stamping_sizes_on_quotation_request_form_id"

  create_table "selection_stampings", :force => true do |t|
    t.string   "stamping_type"
    t.string   "stamping_other"
    t.string   "quotation_request_form_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "selection_varnish_types", :force => true do |t|
    t.integer  "quotation_request_form_id"
    t.string   "varnish_type"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selection_varnish_types", ["quotation_request_form_id"], :name => "index_selection_varnish_types_on_quotation_request_form_id"

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

  create_table "statement_of_accounts", :force => true do |t|
    t.integer  "trade_company_id"
    t.date     "transaction_date"
    t.string   "transaction_type"
    t.integer  "debit_note_id"
    t.integer  "credit_note_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.integer  "receipt_id",                                       :default => 0
    t.integer  "delivery_order_id",                                :default => 0
    t.decimal  "document_amount",   :precision => 10, :scale => 2
    t.decimal  "balance_amount",    :precision => 10, :scale => 2
    t.string   "fp",                                               :default => "N"
    t.decimal  "os_amount",         :precision => 10, :scale => 2
    t.integer  "parent_id"
    t.boolean  "open_balance",                                     :default => false
    t.string   "running_no"
    t.string   "description"
    t.integer  "status",                                           :default => 1
  end

  add_index "statement_of_accounts", ["credit_note_id"], :name => "index_statement_of_accounts_on_credit_note_id"
  add_index "statement_of_accounts", ["debit_note_id"], :name => "index_statement_of_accounts_on_debit_note_id"
  add_index "statement_of_accounts", ["delivery_order_id"], :name => "index_statement_of_accounts_on_delivery_order_id"
  add_index "statement_of_accounts", ["receipt_id"], :name => "index_statement_of_accounts_on_payment_received_id"
  add_index "statement_of_accounts", ["trade_company_id"], :name => "index_statement_of_accounts_on_trade_company_id"

  create_table "ste_customer_histories", :force => true do |t|
    t.integer  "sales_tax_exemption_id"
    t.integer  "product_id"
    t.integer  "trade_company_id"
    t.integer  "delivery_order_item_id"
    t.integer  "unit_measurement_id"
    t.decimal  "before_available_qty",      :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "after_available_qty",       :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "accumulative_complete_qty", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "delivery_qty",              :precision => 10, :scale => 2, :default => 0.0
    t.float    "pc_weight",                                                :default => 0.0
    t.date     "used_date"
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
  end

  add_index "ste_customer_histories", ["delivery_order_item_id"], :name => "index_ste_customer_histories_on_delivery_order_item_id"
  add_index "ste_customer_histories", ["product_id"], :name => "index_ste_customer_histories_on_product_id"
  add_index "ste_customer_histories", ["sales_tax_exemption_id"], :name => "index_ste_customer_histories_on_sales_tax_exemption_id"
  add_index "ste_customer_histories", ["trade_company_id"], :name => "index_ste_customer_histories_on_trade_company_id"
  add_index "ste_customer_histories", ["unit_measurement_id"], :name => "index_ste_customer_histories_on_unit_measurement_id"

  create_table "ste_supplier_histories", :force => true do |t|
    t.integer  "sales_tax_exemption_id"
    t.integer  "product_id"
    t.integer  "purchase_order_id"
    t.integer  "purchase_order_item_line_id"
    t.decimal  "before_available_qty",        :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "after_available_qty",         :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "accumulative_complete_qty",   :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
  end

  add_index "ste_supplier_histories", ["product_id"], :name => "index_ste_supplier_histories_on_product_id"
  add_index "ste_supplier_histories", ["purchase_order_id"], :name => "index_ste_supplier_histories_on_purchase_order_id"
  add_index "ste_supplier_histories", ["purchase_order_item_line_id"], :name => "index_ste_supplier_histories_on_purchase_order_item_line_id"
  add_index "ste_supplier_histories", ["sales_tax_exemption_id"], :name => "index_ste_supplier_histories_on_sales_tax_exemption_id"

  create_table "stock_outs", :force => true do |t|
    t.string   "transfer_note_no"
    t.integer  "product_id"
    t.decimal  "quantity",            :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "balance",             :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.integer  "unit_measurement_id"
    t.string   "collector_name"
    t.integer  "issued_by"
    t.string   "location"
    t.string   "reference_no"
    t.integer  "status",                                             :default => 1
    t.decimal  "previous_stock",      :precision => 10, :scale => 2, :default => 0.0
  end

  add_index "stock_outs", ["product_id"], :name => "index_stock_outs_on_product_id"
  add_index "stock_outs", ["unit_measurement_id"], :name => "index_stock_outs_on_unit_measurement_id"

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
    t.string   "website"
    t.string   "certification"
    t.boolean  "performance_monitoring"
    t.string   "tel_area_code_one"
    t.string   "tel_area_code_two"
    t.string   "fax_area_code"
    t.integer  "postcode_one"
    t.string   "city_one"
    t.string   "state_one"
    t.string   "country_one"
    t.integer  "postcode_two"
    t.string   "city_two"
    t.string   "state_two"
    t.string   "country_two"
    t.integer  "decimal_point",                                           :default => 2
  end

  add_index "trade_companies", ["trade_term_id"], :name => "index_trade_companies_on_trade_term_id"
  add_index "trade_companies", ["type_of_sale_id"], :name => "index_trade_companies_on_type_of_sale_id"

  create_table "trade_terms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "status",      :default => "ACTIVE"
  end

  create_table "transports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "status",     :default => "ACTIVE"
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
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "status",     :default => "ACTIVE"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
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
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "name"
    t.integer  "department_id"
    t.string   "job_title"
    t.integer  "level"
    t.boolean  "admin",                  :default => false
    t.integer  "level_two"
    t.integer  "level_three"
    t.string   "status",                 :default => "ACTIVE"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["department_id"], :name => "index_users_on_department_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
