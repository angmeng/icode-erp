class InventoryManagement

  def self.generate_stock_out(stock_out, issue)
    @stock_out = stock_out
    @inventory = InventoryHistory.new( :product_id => @stock_out.product_id, :stock_in => 0, :stock_out => @stock_out.quantity, :inventory_issue_id => issue, :amount => @stock_out.balance )
    @inventory.save!
    
    @stock_out.product.update_attributes!(:current_stock => @stock_out.balance) if @stock_out.product.present?
  end
  
end