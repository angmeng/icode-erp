class Custom < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  belongs_to :trade_company
  belongs_to :unit_measurement
  
  attr_accessible :apply_qty, :complete_qty, :period_end, :period_start, :sales_tax_exemption, :tarif_code, :trade_company_id, :unit_measurement_id, :sales_tax_exemption_no
  
  validates :sales_tax_exemption, :tarif_code, :length => { :maximum => 50 }
  validates :sales_tax_exemption, :trade_company_id, :period_start, :period_end, :tarif_code, :apply_qty, :complete_qty, :unit_measurement_id, :presence => true
  validates :sales_tax_exemption, :uniqueness => true
  
  def uppercase_text
    self.sales_tax_exemption.upcase!
  end
  
  def self.check_qty(apply_qty, complete_qty)
    if apply_qty < complete_qty
      return true
    else
      return false, "[Alert] Apply Qty is larger than Complete Qty."
    end
  end
  
  def self.ordered
    order("sales_tax_exemption_no").all
  end
end
