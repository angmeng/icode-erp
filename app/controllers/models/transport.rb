class Transport < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :name, :status
  
  has_one :delivery_order
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  validates :name, :uniqueness => true
  
  def self.ordered
    order("name").where(:status => Transport::ACTIVE)
  end
  
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
