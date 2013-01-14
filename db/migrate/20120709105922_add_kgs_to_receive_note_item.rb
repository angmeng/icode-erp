class AddKgsToReceiveNoteItem < ActiveRecord::Migration
  def change
    add_column :receive_note_items, :kgs, :float
    remove_column  :receive_notes, :kgs
    add_column :receive_notes, :sales_tax_exemption_id, :integer
    add_index :receive_notes, :sales_tax_exemption_id
  end
  
#  def down
#    remove_column :receive_note_items, :kgs
#    add_column  :receive_notes, :kgs, :float
#    remove_column :receive_notes, :sales_tax_exemption_id
#    remove_index :receive_notes, :sales_tax_exemption_id
#  end
end
