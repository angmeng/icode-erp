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
  has_one :outgoing_reject
  
  validates :name, :uniqueness => true
  
  default_scope order("name")
  
  scope :db_active, where(:status => TradeTerm::ACTIVE)
  
  def self.ordered_name(search)
    search.where(:status => TradeTerm::ACTIVE)
  end
  
  def self.ordered_name_kiv(search)
    search.where(:status => TradeTerm::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.name.upcase! if self.name?
  end
end
