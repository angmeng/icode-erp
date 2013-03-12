class PackingQuantity < ActiveRecord::Base
  attr_accessible :quantity, :packing_type, :product_id
  
  belongs_to :product
end
