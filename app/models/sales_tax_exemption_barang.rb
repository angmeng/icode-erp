class SalesTaxExemptionBarang < ActiveRecord::Base
  attr_accessible :apply_qty, :complete_qty, :perihal_barang, :sales_tax_exemption_id, :tarif_code, :unit_measurement_id, 
                  :valid_weight_condition, :available_qty, :calculate_um_id
  
  belongs_to :sales_tax_exemption
  belongs_to :unit_measurement
  
  belongs_to :belongs_to_cal_um, :foreign_key => "calculate_um_id", :class_name => "UnitMeasurement"
  
  has_many :products
  
  validates :perihal_barang, :tarif_code, :apply_qty, :unit_measurement_id, :available_qty, :calculate_um_id, :presence => true
  
  validates :apply_qty, :numericality => { :greater_than => 0 }
end
