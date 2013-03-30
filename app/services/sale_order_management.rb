class SaleOrderManagement
  
  def self.running_sales_order_items(datarow, sales_order)
    if datarow.present?
      sales_order.sales_order_items.delete_all if sales_order.sales_order_items.present?
      datarow.each do |key, content|
        s_order = sales_order.sales_order_items.build(:product_id => content[:product_id], :quantity => content[:quantity], :unit_measurement_id => content[:unit_measurement_id], :unit_price => content[:unit_price], :eta => content[:eta_date], :customer_po => content[:customer_po], :part_no => content[:part_no], :status => SalesOrderItem::PENDING)
        unless s_order.valid?
          return false, msg = s_order.errors.full_messages
          break;
        end
      end
      return sales_order
    end
  end
    
end