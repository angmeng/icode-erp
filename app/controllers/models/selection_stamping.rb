class SelectionStamping < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :stamping_other, :stamping_type, :quotation_request_form_id
  
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.stamping_other.upcase! if self.stamping_other.present?
  end
end
