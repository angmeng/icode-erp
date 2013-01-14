class AddItemsToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :purchase_requisition_item_id, :integer
    add_column :receive_notes, :received_qty, :integer
    add_column :receive_notes, :order_qty, :integer
    add_column :receive_notes, :balance_qty, :integer
    add_column :receive_notes, :current_stock, :integer
    add_column :receive_notes, :vendor_part, :string
  end
end
