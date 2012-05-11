class PurchaseOrderItem < ActiveRecord::Base
  attr_accessible :code, :color_grade, :current_stock, :cutoff_date, :desc, :model, :opening_stock, :part_no, :part_weight, :selling_price, :tariff_code, :unit_measurement_id, :version
  
  belongs_to :unit_measurement
  
  validates :code, :color_grade, :current_stock, :cutoff_date, :desc, :model, :opening_stock, :part_no, :part_weight, :selling_price, :tariff_code, :unit_measurement_id, :version, :presence => true
end
