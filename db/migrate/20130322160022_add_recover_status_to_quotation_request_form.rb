class AddRecoverStatusToQuotationRequestForm < ActiveRecord::Migration
  def change
#    change_column :price_controls, :pp_no, :string
#    change_column :delivery_orders, :tport_c, :decimal, :precision => 10, :scale => 2, :default => 0.00
    add_column    :quotation_request_forms, :recover_status, :string
#    add_column    :product_customers, :currency_id, :integer
#    add_column    :product_vendors, :currency_id, :integer
    add_column :stock_outs, :status, :integer, :default => 1  # default 1 is ACTIVE
    
#    remove_column :products, :color_grade
#    remove_column :products, :version
#    remove_column :products, :model
#    remove_column :products, :part_no
    remove_column :products, :selling_price
    remove_column :products, :buying_price
    remove_column :products, :current_price

    
  end
end
