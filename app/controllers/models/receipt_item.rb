class ReceiptItem < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  attr_accessible :balance_amount, :document_amount, :document_date, :document_no, :fp, :os_amount, :receipt_id, :receipt_type, :status_id
  
  validates :document_no, :document_date, :document_amount, :presence => true
  
  belongs_to :receipt
  
  def uppercase_text
    self.fp.upcase!           if self.fp.present?
  end
end
