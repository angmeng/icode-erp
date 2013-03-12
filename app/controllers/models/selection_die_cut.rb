class SelectionDieCut < ActiveRecord::Base
  attr_accessible :content, :quotation_request_form_id
  belongs_to :quotation_request_form
end
