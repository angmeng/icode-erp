class AddItemToReceiveNoteItem < ActiveRecord::Migration
  def change
    rename_column :receive_note_items, :purchase_order_id, :purchase_order_item_line_id
    rename_column :receive_note_items, :received_quantity, :received_qty
    rename_column :receive_note_items, :order_quantity, :order_qty
    rename_column :receive_note_items, :vendor_part, :vendor_part_no
    
    remove_column :receive_note_items, :status
    remove_column :receive_note_items, :balance_quantity
    remove_column :receive_note_items, :current_stock
    
    remove_column :purchase_order_item_lines, :vendor_delivery_no
    remove_column :purchase_order_item_lines, :licence_no
    remove_column :purchase_order_item_lines, :rn_qty
    remove_column :purchase_order_item_lines, :ir_qty
    remove_column :purchase_order_item_lines, :vendor_part_no
  end
end
