class Role < ActiveRecord::Base
  attr_accessible :inventory_management_system_id, :user_id
  
  belongs_to :inventory_management_system
  belongs_to :user
end
