class StockOut < ActiveRecord::Base
  attr_accessible :amount, :balance, :product_id, :transfer_note
end
