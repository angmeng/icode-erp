class SelectionVarnishType < ActiveRecord::Base
  attr_accessible :quotation_request_form_id, :varnish_type
  
  belongs_to :quotation_request_form
end
