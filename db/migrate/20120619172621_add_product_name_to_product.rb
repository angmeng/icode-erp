class AddProductNameToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_name, :string

  end
end
