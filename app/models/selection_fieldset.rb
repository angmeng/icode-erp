class SelectionFieldset < ActiveRecord::Base
  attr_accessible :quotation_request_form_id, :select_no
  
  belongs_to :quotation_request_form
end
