class CustomProduction < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :category_no, :lot_size, :part_no, :stock_reference, :quotation_request_form_id
  
  belongs_to :quotation_request_form
  
  def uppercase_text
    self.lot_size.upcase! if self.lot_size.present?
    self.part_no.upcase!   if self.part_no.present?
    self.stock_reference.upcase!   if self.stock_reference.present?
    self.category_no.upcase!   if self.category_no.present?
  end
end
