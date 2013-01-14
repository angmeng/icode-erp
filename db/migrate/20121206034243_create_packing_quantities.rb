class CreatePackingQuantities < ActiveRecord::Migration
  def change
    create_table :packing_quantities do |t|
      t.float :quantity, :default => 0.00, :precision => 2, :scale => 10
      t.string :packing_type
      t.integer :product_id
    end
    add_index :packing_quantities, :product_id
  end
end
