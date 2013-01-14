class Material < ActiveRecord::Base
  attr_accessible :code, :description
  
  validates :description, :uniqueness => true
  
  ACTIVE = "Active"
end
