class CompanyProfile < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :address, :fax_no, :name, :reg_no, :sales_tax_no, :sn_bankin_slip_no, :sn_billing_order_no, :sn_credit_note_no, :sn_debit_note_no, :sn_deliver_order_no, :sn_incoming_reject_no, :sn_job_order_no, :sn_journal_voucher_no, :sn_outgoing_reject_no, :sn_payment_voucher_no, :sn_product_price_no, :sn_purchase_order_no, :sn_purchase_req_no, :sn_receipt_no, :sn_receive_note_no, :sn_sales_order_no, :sn_shipment_schedule, :sn_shipping_instr_no, :sn_store_voucher_no, :sn_transfer_slip_no, :sn_receiving_instr_no, :sn_scrap_sheet_no, :tel_no_1, :tel_no_2, :sn_product_id_no, :sn_sales_tax_exemption_no, :sn_quotation_request_no, :sn_bom_no, :total_amount
  validates :name, :address, :tel_no_1, :tel_no_2, :fax_no, :sales_tax_no, :reg_no, :presence => true
  
  validates :name, :length => { :maximum => 50 ,:message => "should be at least 50 characters." }
  validates :address, :length => { :maximum => 200, :message => "should be at least 200 characters." }
  validates :tel_no_1, :tel_no_2, :fax_no, :format => { :with => /^\d{2,3}\-\d{7,8}$/, :message => "should be like 04-xxxxxxx" }
  
  validates :sales_tax_no, :length => { :is => 7 }
  validates :reg_no, :length => { :is => 8 }
  
  validates :sn_sales_order_no, :sn_transfer_slip_no, :sn_purchase_order_no, :sn_store_voucher_no, :sn_deliver_order_no, :sn_incoming_reject_no, :sn_receive_note_no, :sn_outgoing_reject_no, :sn_credit_note_no, :sn_job_order_no, :sn_debit_note_no, :sn_shipment_schedule, :sn_billing_order_no, :sn_scrap_sheet_no,:sn_purchase_req_no, :sn_receiving_instr_no, :sn_product_price_no, :sn_shipping_instr_no, :sn_receipt_no, :sn_journal_voucher_no, :sn_bankin_slip_no, :sn_payment_voucher_no, 
            :format => { :with => /^[0-9]\d{0,5}$/, :message => "must have integer." }
    
  def uppercase_text
    self.name.upcase!
    self.address.upcase!
    self.sales_tax_no.upcase!
    self.reg_no.upcase!
  end
  
  ROLE = [
    InventoryManagementSystem::COMPANY_PROFILE_MENU,
    InventoryManagementSystem::COMPANY_PROFILE_VIEW,
    InventoryManagementSystem::COMPANY_PROFILE_SHOW,
    InventoryManagementSystem::COMPANY_PROFILE_EDIT,
    InventoryManagementSystem::COMPANY_PROFILE_KIV,
    InventoryManagementSystem::COMPANY_PROFILE_PRINTABLE
  ]
end
