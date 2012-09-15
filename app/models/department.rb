class Department < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  attr_accessible :name, :status
  has_one :user
  validates :name, :uniqueness => true
  
  def uppercase_text
    self.name.upcase! if self.name?
  end  
  
  def self.order_name
    order("name").where(:status => Department::ACTIVE)
  end
  
  def self.ordered_name(search)
    search.order("name").where(:status => Department::ACTIVE)
  end
  
  def self.ordered_name_kiv(search)
    search.order("name").where(:status => Department::KEEP_IN_VIEW)
  end
end
