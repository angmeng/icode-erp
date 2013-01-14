class CreatePurchaseRequisitionItems < ActiveRecord::Migration
  def change
    create_table :purchase_requisition_items do |t|
      t.integer :purchase_requisition_id
      t.integer :product_id
      t.integer :trade_company_id
      t.text :description
      t.integer :quantity, :default => 1
      t.integer :unit_measurement_id
      t.string :eta
      t.string :purchase_order_no
      t.float :unit_price, :decimal, {:default => 0.0000, :scale => 4, :precision => 10 }
      t.text :remark

      t.timestamps
    end
    add_index :purchase_requisition_items, :purchase_requisition_id
    add_index :purchase_requisition_items, :product_id
    add_index :purchase_requisition_items, :trade_company_id
    add_index :purchase_requisition_items, :unit_measurement_id
  end
end
