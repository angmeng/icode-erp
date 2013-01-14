class AddStatusToInventoryHistory < ActiveRecord::Migration
  def change
    add_column :inventory_histories, :status, :string, :default => InventoryHistory::ACTIVE
  end
end
