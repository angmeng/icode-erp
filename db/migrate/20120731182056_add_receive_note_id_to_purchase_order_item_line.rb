class AddReceiveNoteIdToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :receive_note_id, :integer
  end
end
