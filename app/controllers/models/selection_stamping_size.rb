class SelectionStampingSize < ActiveRecord::Base
  attr_accessible :quotation_request_form_id, :stamping_length, :stamping_width
  
  belongs_to :quotation_request_form
end
