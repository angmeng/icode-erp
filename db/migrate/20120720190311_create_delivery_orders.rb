class CreateDeliveryOrders < ActiveRecord::Migration
  def change
    create_table :delivery_orders do |t|
      t.integer :do_no
      t.integer :trade_company_id
      t.integer :sales_tax, :default => 0
      t.integer :type_of_sales_id
      t.float :tport_c
      t.integer :currency_id
      t.integer :bk_two
      t.integer :trade_term_id
      t.integer :updated_by
      t.integer :transport_id
      t.string :sales_rep
      t.string :sales_tax_exemption

      t.timestamps
    end
    add_index :delivery_orders, :trade_company_id
    add_index :delivery_orders, :type_of_sales_id
    add_index :delivery_orders, :currency_id
    add_index :delivery_orders, :trade_term_id
    add_index :delivery_orders, :transport_id
  end
end
