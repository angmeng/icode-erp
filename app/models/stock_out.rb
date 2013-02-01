class StockOut < ActiveRecord::Base

  attr_accessible :quantity, :balance, :product_id, :transfer_note_no, :unit_measurement_id , :collector_name ,:issued_by , :location,  :reference_no
  validates :quantity, :balance, :product_id, :transfer_note_no, :presence => true
  
  belongs_to :product_combobox
  belongs_to :unit_measurement

end
