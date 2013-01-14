class AddEffDateToProductCustomer < ActiveRecord::Migration
  def change
    add_column :product_customers, :eff_date, :date
    add_column :delivery_orders, :status, :string, :default => "Active"
    rename_column :delivery_orders, :type_of_sales_id, :type_of_sale_id
  end
end
