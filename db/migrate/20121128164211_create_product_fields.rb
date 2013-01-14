class CreateProductFields < ActiveRecord::Migration
  def change
    create_table :product_fields do |t|
      t.integer :category_id
      t.integer :field_id

      t.timestamps
    end
  end
end
