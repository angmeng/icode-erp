class SelectionGlueing < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  attr_accessible :glueing, :quotation_request_form_id, :glueing_other
  belongs_to :quotation_request_form  
  def uppercase_text
    self.glueing_other.upcase! if self.glueing_other.present?
  end
end
