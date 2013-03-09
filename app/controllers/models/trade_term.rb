class TradeTerm < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :description, :name, :status
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  has_many :trade_companies
  has_many :sales_orders
  
  has_one :purchase_order
  has_one :delivery_order
  
  validates :name, :uniqueness => true
  
  scope :ordered, order("name").where(:status => TradeTerm::ACTIVE)
  
  def self.ordered_name(search)
    search.order("name").where(:status => TradeTerm::ACTIVE)
  end
  
  def self.ordered_name_kiv(search)
    search.order("name").where(:status => TradeTerm::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.name.upcase! if self.name?
  end
end
