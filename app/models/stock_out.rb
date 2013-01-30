class StockOut < ActiveRecord::Base
  attr_accessible :amount, :balance, :product_id, :transfer_note_no
  validates :amount, :balance, :product_id, :transfer_note_no, :presence => true
  
  belongs_to :product_combobox
end
