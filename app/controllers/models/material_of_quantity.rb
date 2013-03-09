class MaterialOfQuantity < ActiveRecord::Base
  attr_accessible :quantity, :quotation_request_form_id, :unit_price
  
  belongs_to :quotation_request_form
end
