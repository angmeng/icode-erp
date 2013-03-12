class ChangeCompanyCode < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :new_code, :old_code, :remark, :trade_company_id
  
  validates :old_code, :new_code, :presence => true
  
  private
  def uppercase_text
    self.new_code.upcase! if self.new_code.present?
    self.old_code.upcase! if self.old_code.present?
  end
end
