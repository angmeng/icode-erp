class AddColumnToDeliveryOrder < ActiveRecord::Migration
  def change
    add_column :delivery_orders, :authorize_print, :boolean , :default => false
  end
end
