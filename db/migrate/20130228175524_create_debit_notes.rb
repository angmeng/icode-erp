class CreateDebitNotes < ActiveRecord::Migration
  def change
    create_table :debit_notes do |t|
      t.string :debit_note_no
      t.date :debit_note_date
      t.integer :trade_company_id
      t.string :debit_type
      
      t.integer :currency_id
      t.integer :updated_by
      t.decimal :amount, :precision => 10, :scale => 2, :default => 0
      t.integer :status_id, :default => 1
      t.integer :account_id
      t.timestamps
    end
    add_index :debit_notes, :trade_company_id
    add_index :debit_notes, :currency_id
  end
end
