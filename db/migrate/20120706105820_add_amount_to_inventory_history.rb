class AddAmountToInventoryHistory < ActiveRecord::Migration
  def change
    add_column :inventory_histories, :amount, :integer, :default => 0
  end
end
