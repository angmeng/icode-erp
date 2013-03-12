class Color < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :color_code, :quotation_request_form_id, :color_name
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.color_name.upcase! if self.color_name.present?
    self.color_code.upcase! if self.color_code.present?
  end
end
