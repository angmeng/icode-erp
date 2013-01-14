class CreatePriceControlItems < ActiveRecord::Migration
  def change
    create_table :price_control_items do |t|
      t.integer :product_id
      t.float :old_unit_price, :precision => 4, :scale => 10, :default => 0
      t.date :old_eff_date
      t.float :new_unit_price, :precision => 4, :scale => 10, :default => 0
      t.date :new_eff_date
      t.string :part_no
      t.string :status, :default => 'Active'
      t.integer :user_id
      t.integer :price_control_id

      t.timestamps
    end
    
    add_index :price_control_items, :product_id
    add_index :price_control_items, :user_id
    add_index :price_control_items, :price_control_id
  end
end
