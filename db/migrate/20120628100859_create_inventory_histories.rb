class CreateInventoryHistories < ActiveRecord::Migration
  def change
    create_table :inventory_histories do |t|
      t.integer :purchase_requisition_item_line_id
      t.integer :product_id
      t.integer :stock_in
      t.integer :stock_out
      t.integer :issue_id

      t.timestamps
    end
    add_index :inventory_histories, :purchase_requisition_item_line_id
    add_index :inventory_histories, :product_id
  end
end
