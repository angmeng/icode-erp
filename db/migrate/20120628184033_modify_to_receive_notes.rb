class ModifyToReceiveNotes < ActiveRecord::Migration
  def change
    remove_column :receive_notes, :receive_note_date
    remove_column :receive_notes, :trade_company_id
    remove_column :receive_notes, :currency_id
    remove_column :receive_notes, :trade_term_id
    remove_column :receive_notes, :sale_tax_exempt
    remove_column :receive_notes, :purchase_requisition_item_id
    remove_column :receive_notes, :received_qty
    remove_column :receive_notes, :order_qty
    remove_column :receive_notes, :balance_qty
    remove_column :receive_notes, :vendor_part
    remove_column :receive_notes, :after_current_stock
    remove_column :receive_notes, :before_current_stock
  end
end
