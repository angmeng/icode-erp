class InventoryManagement
  
  # Remember we should manage two things: (1) InventoryHistories (2) Products

  def self.generate_stock_out(stock_out, issue)
    @stock_out = stock_out
    @inventory = InventoryHistory.new( :product_id => @stock_out.product_id, :stock_in => 0, :stock_out => @stock_out.quantity, :inventory_issue_id => issue, :amount => @stock_out.balance )
    @inventory.save!
    
    @stock_out.product.update_attributes!(:current_stock => @stock_out.balance) if @stock_out.product.present?
  end
  
  def self.check_current_stock(product_id, in_out, inventory_history)
    if in_out.present?
      product = Product.find(product_id)
      if in_out == "IN"
        if inventory_history.stock_in.present?
          if inventory_history.stock_in > 0
            inventory_history.amount = product.current_stock + inventory_history.stock_in
            inventory_history.stock_out = 0
            return true
          else
            return false, "The value is overflow."
          end
        else
          return false, "Stock In can't blank."
        end
      else
        if inventory_history.stock_out.present?
          if product.current_stock >= inventory_history.stock_out and inventory_history.stock_out > 0
            inventory_history.amount = product.current_stock - inventory_history.stock_out
            inventory_history.stock_in = 0
            return true
          else
            return false, "The value is over the current stock or not zero."
          end
        else
          return false, "Stock Out can't blank."
        end
      end
    else
      return false, "Type can't blank.."
    end
  end
  
end