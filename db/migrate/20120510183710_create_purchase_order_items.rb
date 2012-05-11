class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
      t.string :code
      t.integer :unit_measurement_id
      t.string :desc
      t.string :color_grade
      t.string :version
      t.string :model
      t.string :part_no
      t.string :tariff_code
      t.float :part_weight
      t.float :selling_price
      t.date :cutoff_date
      t.float :opening_stock
      t.float :current_stock

      t.timestamps
    end
    add_index :purchase_order_items, :unit_measurement_id
  end
end
