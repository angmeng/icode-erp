class GroupRunningNo < ActiveRecord::Base
  attr_accessible :code, :current_no
  
  validates :code, :uniqueness => true
end
