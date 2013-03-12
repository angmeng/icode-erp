class SelectionFluteSize < ActiveRecord::Base
  attr_accessible :flute_length, :flute_width, :quotation_request_form_id
  
  belongs_to :quotation_request_form
end
