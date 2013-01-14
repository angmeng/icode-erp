class BillOfMaterial < ActiveRecord::Base
  attr_accessible :bom_no, :sales_order_item_id, :type
end
