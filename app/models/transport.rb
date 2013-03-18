class Transport < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :name, :status
  
  has_one :delivery_order
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  validates :name, :uniqueness => true
  
  default_scope order("name")
  
  scope :db_active, where(:status => Transport::ACTIVE)
  
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
