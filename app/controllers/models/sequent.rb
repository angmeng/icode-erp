class Sequent < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :quotation_request_form_id, :sequent_color
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.sequent_color.upcase! if self.sequent_color.present?
  end
end
