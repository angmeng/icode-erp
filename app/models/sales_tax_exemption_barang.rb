class SalesTaxExemptionBarang < ActiveRecord::Base
  attr_accessible :apply_qty, :complete_qty, :perihal_barang, :sales_tax_exemption_id, :tarif_code, :unit_measurement_id, :valid_condition
  
  belongs_to :sales_tax_exemption
  belongs_to :unit_measurement
  
  has_many :products
  
  validates_presence_of :perihal_barang, :tarif_code, :apply_qty, :unit_measurement_id
  
  validates :apply_qty, :numericality => { :greater_than => 0 }
end
