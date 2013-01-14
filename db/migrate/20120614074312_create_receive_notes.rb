class CreateReceiveNotes < ActiveRecord::Migration
  def change
    create_table :receive_notes do |t|
      t.integer :receive_note_no
      t.date    :receive_note_date
      t.integer :trade_company_id
      t.integer :currency_id
      t.integer :trade_term_id
      t.integer :vendor_delivery_no
      t.integer :sale_tax_exempt, :default => 0
      t.integer :updated_by
      t.timestamps
    end
    add_index :receive_notes, :trade_company_id
    add_index :receive_notes, :currency_id
    add_index :receive_notes, :trade_term_id
  end
end
