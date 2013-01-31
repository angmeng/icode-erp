class StockOut < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :amount, :balance, :product_id, :transfer_note
=======
  attr_accessible :amount, :balance, :product_id, :transfer_note_no
  validates :amount, :balance, :product_id, :transfer_note_no, :presence => true
  
  belongs_to :product_combobox
>>>>>>> 4127eef4ca7305cceee9cbb695e58987c99b7269
end
