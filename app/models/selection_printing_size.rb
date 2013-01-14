class SelectionPrintingSize < ActiveRecord::Base
  attr_accessible :length, :quotation_request_form_id, :ups, :width
  
  belongs_to :quotation_request_form
end
