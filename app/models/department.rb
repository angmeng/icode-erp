class Department < ActiveRecord::Base
  attr_accessible :name
  has_one :user
  validates :name, :uniqueness => true
  
end
