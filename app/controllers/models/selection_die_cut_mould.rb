class SelectionDieCutMould < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  attr_accessible :mould_no, :quotation_request_form_id, :window_no
  
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.mould_no.upcase! if self.mould_no.present?
    self.window_no.upcase!   if self.window_no.present?
  end
end
