class RenameColumnToInventoryHistories < ActiveRecord::Migration
  def change
    rename_column :inventory_histories, :purchase_requisition_item_line_id, :receive_note_item_id
  end
end
