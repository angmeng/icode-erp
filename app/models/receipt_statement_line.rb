class ReceiptStatementLine < ActiveRecord::Base
  attr_accessible :receipt_id, :statement_of_account_id
  validates :receipt_id, :statement_of_account_id, :presence => true
  belongs_to :receipt
  belongs_to :statement_of_account
  
  

end