class Bom < ActiveRecord::Base
  attr_accessible :customer_po_no, :quotation_request_form_id, :status, :prepared_by,
    :paper, :original_size, :trim_size, :ratio, :paper_product_id, :packing_qty, :mould_no, :ecn, :finishing
end
