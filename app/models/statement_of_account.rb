class StatementOfAccount < ActiveRecord::Base
  attr_accessible :credit_note_id, :debit_note_id, :trade_company_id, :transaction_date, :transaction_type
  
  belongs_to :credit_note
  belongs_to :debit_note
  
  validates :trade_company_id, :transaction_date, :presence => true
end
