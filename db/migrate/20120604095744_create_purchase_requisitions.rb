class CreatePurchaseRequisitions < ActiveRecord::Migration
  def change
    create_table :purchase_requisitions do |t|
      t.integer :pr_no
      t.date    :purchase_date
      t.integer :product_id
      t.integer :trade_company_id
      t.text    :description
      t.integer :quantity, :default => 1
      t.integer :unit_measurement_id
      t.string  :eta
      t.string  :purchase_order_no
      t.float   :unit_price, :decimal, {:default => 0.0000, :scale => 4, :precision => 10 }
      t.text    :remark
      t.string  :status

      t.timestamps
    end
    add_index :purchase_requisitions, :product_id
    add_index :purchase_requisitions, :trade_company_id
    add_index :purchase_requisitions, :unit_measurement_id
  end
end
