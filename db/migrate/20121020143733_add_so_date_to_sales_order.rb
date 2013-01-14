class AddSoDateToSalesOrder < ActiveRecord::Migration
  def change
    add_column :company_profiles, :sn_bom_no, :integer, { :default => 0 }
    add_column :sales_orders, :so_date, :date
    add_column :sales_orders, :status, :string, :default => "Active"
    add_column :sales_order_items, :um_name, :string
    add_column :sales_order_items, :trade_company_id, :integer
    add_column :products, :buying_price, :float, {:default => 0.0000, :scale => 10, :precision => 4 }
    add_column :quotation_request_forms, :customer_code, :string
    add_column :quotation_request_forms, :customer_po_no, :string
  end
end
