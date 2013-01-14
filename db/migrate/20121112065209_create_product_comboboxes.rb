class CreateProductComboboxes < ActiveRecord::Migration
  def change
    create_table :product_comboboxes do |t|
      t.integer :product_id
      t.string :product_code
      t.string :status, :default => "Active"
      t.integer :category_type

      t.timestamps
    end
    add_index :product_comboboxes, :product_id
  end
end
