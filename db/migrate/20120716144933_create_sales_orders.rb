class CreateSalesOrders < ActiveRecord::Migration
  def change
    create_table :sales_orders do |t|
      t.integer :sales_order_no
      t.integer :trade_company_id
      t.string :purchase_order_no
      t.string :sales_rep
      t.integer :currency_id
      t.integer :trade_term_id
      t.integer :revision
      t.integer :purpose
      t.integer :updated_by

      t.timestamps
    end
    add_index :sales_orders, :trade_company_id
    add_index :sales_orders, :currency_id
    add_index :sales_orders, :trade_term_id
  end
end
