class PriceControlItem < ActiveRecord::Base
  attr_accessible :new_eff_date, :new_unit_price, :old_eff_date, :old_unit_price, :part_no, :product_id, :status, :user_id, :price_control_id
  
  validates :new_eff_date, :new_unit_price, :product_id, :presence => true
  
  belongs_to :product
  belongs_to :user
  belongs_to :price_control
  
  ACTIVE = 'Active' #Open for Current Price
  CLOSE = 'Close' #Close for Change New Price
#  CONFIRMED = 'Confirmed'
  KEEP_IN_VIEW = 'KIV'
  
  scope :db_active,    where(:status => PriceControlItem::ACTIVE)
#  scope :db_confirmed, where(:status => PriceControlItem::CONFIRMED)

  def price_control_trade_company_id
    self.price_control.trade_company_id
  end
  
  def self.ordering_price_control_item
    joins([:price_control, :price_control => :trade_company]).order("code ASC, price_controls.pp_date DESC")
  end
end
