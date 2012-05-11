class Category < ActiveRecord::Base
  attr_accessible :code, :desc, :parent_id
  validates :code, :desc, :presence => true
end
