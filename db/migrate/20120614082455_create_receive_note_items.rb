class CreateReceiveNoteItems < ActiveRecord::Migration
  def change
    create_table :receive_note_items do |t|
      t.integer :receive_note_id
      t.integer :purchase_order_id
      t.integer :received_quantity
      t.string :status
      t.integer :order_quantity
      t.integer :balance_quantity
      t.integer :current_stock
      t.string :vendor_part

      t.timestamps
    end
  end
end
