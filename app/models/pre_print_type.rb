class PrePrintType < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :pre_print, :quotation_request_form_id, :other
  
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.other.upcase! if self.other.present?
  end
end
