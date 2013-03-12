class TemporarySource < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :company_name, :remark, :select_vendor, :unit_price
  
#  validates :company_name, :unit_price, :presence => true
  
  belongs_to :purchase_requisition_item
  
  def uppercase_text
    self.company_name.upcase! if self.company_name.present?
    self.remark.upcase!       if self.remark.present?
  end
end
