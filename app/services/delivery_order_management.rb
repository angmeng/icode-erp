class DeliveryOrderManagement
  
  def self.running_delivery_order_items(data, delivery_order)
    if data.present?
      delivery_order.delivery_order_items.delete_all if delivery_order.delivery_order_items.present?
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
          :client_po => content[:client_po]
        )
        unless d_order.valid?
          return false, msg = d_order.errors.full_messages
          break;
        end
      end
      return delivery_order
    end
  end
  
  def self.manage_inventory_and_product(delivery_order)
    if delivery_order.present?
      if delivery_order.delivery_order_items.present?
        delivery_order.delivery_order_items.each do |doi|
          if doi.present?
            if doi.sales_order_item.present?
              InventoryHistory.create!(:product_id => doi.sales_order_item.product_id, :stock_in => 0, :stock_out => doi.delivery_qty, :amount => doi.gen_current_stock, :inventory_issue_id => InventoryIssue::DELIVERY_ORDER_OUT)
              doi.sales_order_item.product.update_attributes!(:current_stock => doi.gen_current_stock)
              doi.sales_order_item.update_attributes!(:remaining_qty => doi.balance_qty)
              doi.sales_order_item.update_attributes!(:status => SalesOrderItem::COMPLETED) if doi.so_balance_qty_is_zero?
              self.shipping_full_stock(doi.sales_order_item)
              
              self.insert_account_statement(doi.sales_order_item)
            end
          end
        end
      end
    end
  end
  
  def self.shipping_full_stock(soi)
    count     = 0
    so        = soi.sales_order
    max_count = so.sales_order_items.count
    so.sales_order_items.each { |soi| count += 1  if soi.is_completed? }
    so.update_attributes!(:status => SalesOrder::COMPLETED) if count == max_count
  end
  
  def self.insert_account_statement(soi)
    @soa = StatementOfAccount.new(:trade_company_id => self.sales_order.trade_company_id, :transaction_date => self.sales_order.so_date, :transaction_type => "INV", :credit_note_id => 0, :debit_note_id => self.id)
    @soa.save!
  end
end