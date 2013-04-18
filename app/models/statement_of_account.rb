class StatementOfAccount < ActiveRecord::Base
  attr_accessible :credit_note_id, :debit_note_id, :trade_company_id, :transaction_date, :transaction_type, :payment_received_id, :delivery_order_id
  
  belongs_to :credit_note
  belongs_to :debit_note
  belongs_to :payment_received
  belongs_to :delivery_order
  
  validates :trade_company_id, :transaction_date, :presence => true
end
