class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.text :address
      t.string :tel_no_1
      t.string :tel_no_2
      t.string :fax_no
      t.string :sales_tax_no
      t.string :reg_no
      t.integer :sn_sales_order_no,       :default => 0
      t.integer :sn_purchase_order_no,    :default => 0
      t.integer :sn_deliver_order_no,     :default => 0
      t.integer :sn_receive_note_no,      :default => 0
      t.integer :sn_transfer_slip_no,     :default => 0
      t.integer :sn_store_voucher_no,     :default => 0
      t.integer :sn_incoming_reject_no,   :default => 0
      t.integer :sn_outgoing_reject_no,   :default => 0
      t.integer :sn_credit_note_no,       :default => 0
      t.integer :sn_debit_note_no,        :default => 0
      t.integer :sn_billing_order_no,     :default => 0
      t.integer :sn_purchase_req_no,      :default => 0
      t.integer :sn_product_price_no,     :default => 0
      t.integer :sn_job_order_no,         :default => 0
      t.integer :sn_shipment_schedule,    :default => 0
      t.integer :sp_scrap_sheet_no,       :default => 0
      t.integer :sp_receiving_instr_no,   :default => 0
      t.integer :sn_shipping_instr_no,    :default => 0
      t.integer :sn_receipt_no,           :default => 0
      t.integer :sn_bankin_slip_no,       :default => 0
      t.integer :sn_journal_voucher_no,   :default => 0
      t.integer :sn_payment_voucher_no,   :default => 0

      t.timestamps
    end
  end
end
