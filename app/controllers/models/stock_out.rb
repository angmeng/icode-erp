class StockOut < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text

  attr_accessible :quantity, :balance, :product_id, :transfer_note_no, :unit_measurement_id, :collector_name, :issued_by, :location, :reference_no
  
  validates :quantity, :balance, :product_id, :transfer_note_no, :unit_measurement_id, :collector_name, :issued_by, :location, :presence => true
  
  belongs_to :product_combobox
  belongs_to :unit_measurement
  belongs_to :product
  
  def uppercase_text
    self.collector_name.upcase!
    self.location.upcase!
    self.reference_no.upcase!
  end

end
