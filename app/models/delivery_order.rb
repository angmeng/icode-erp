class DeliveryOrder < ActiveRecord::Base
  attr_accessible :bk_two, :currency_id, :do_no, :sales_rep, :sales_tax, :sales_tax_exemption, :tport_c, :trade_company_id, :trade_term_id, :transport_id, :type_of_sale_id, :updated_by, :do_date
  
  has_many :delivery_order_items, :dependent => :destroy
  
  belongs_to :trade_company
  belongs_to :type_of_sale
  belongs_to :currency
  belongs_to :trade_term
  belongs_to :transport
  
  def self.running_delivery_order_items(data, delivery_order)
    if data.present?
      data.each do |key, content|
        d_order = delivery_order.delivery_order_items.build(
          :sales_order_item_id => content[:sales_order_item_id],
          :so_date => content[:so_date],
          :delivery_qty => content[:delivery_qty],
          :order_qty => content[:order_qty],
          :unit_price => content[:unit_price],
          :balance_qty => content[:balance_qty],
          :no_of_carton => content[:no_of_carton],
          :gen_current_stock => content[:gen_cur_stock],
          :part_no => content[:part_no],
          :client_lot => content[:client_lot],
          :client_po => content[:client_po],
          :department => content[:department],
          :dept_current_stock => content[:dept_cur_stock]
        )
        if d_order.valid? 
          return true
        else
          return false, msg = d_order.errors.full_messages
          break;
        end
      end  
    end
  end
  
end