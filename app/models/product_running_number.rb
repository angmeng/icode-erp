class ProductRunningNumber < ActiveRecord::Base
  attr_accessible :base_name, :running_no, :sub_name
  
  validates :base_name, :uniqueness => { :scope => :sub_name }
end
