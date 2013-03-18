class TypeOfSale < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_one :delivery_order
  
  has_many :trade_companies
  
  validates :name, :uniqueness => true
  
  default_scope order("name")
  
#  def self.ordered
#    all
#  end
end
