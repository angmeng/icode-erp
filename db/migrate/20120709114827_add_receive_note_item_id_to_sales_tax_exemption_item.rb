class AddReceiveNoteItemIdToSalesTaxExemptionItem < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemption_items, :receive_note_item_id, :integer
    add_column :sales_tax_exemption_items, :kgs, :float
  end
end
