class ProductRunningNumber < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :base_name, :sub_name, :running_no, :product_category_id, :copied_no
  
  belongs_to :product_category
  
  validates :base_name, :uniqueness => { :scope => :sub_name }
  
  private
  
  def uppercase_text
    self.base_name.upcase!
    self.sub_name.upcase!
  end 
end
