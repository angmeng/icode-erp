class TypeOfSale < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_one :delivery_order
  
  has_many :trade_companies
  
  validates :name, :uniqueness => true
  
  def self.ordered
    order("name").all
  end
end
