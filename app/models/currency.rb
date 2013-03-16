class Currency < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :name, :status
  validates :name, :uniqueness => true
  
  has_one :product_price
  has_one :purchase_order
  has_one :sales_orders
  has_one :price_control
  has_one :delivery_order
  has_one :credit_note
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
    
  default_scope order("name")
  
  scope :db_active, where(:status => Currency::ACTIVE)
  
  def self.ordered_name(search)
    search.where(:status => Currency::ACTIVE)
  end

  def self.ordered_name_kiv(search)
    search.where(:status => Currency::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.name.upcase! if self.name?
  end
end
