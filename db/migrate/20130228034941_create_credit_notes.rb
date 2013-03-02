class CreateCreditNotes < ActiveRecord::Migration
  def change
    create_table :credit_notes do |t|
      t.string :credit_note_no
      t.date :credit_note_date
      t.integer :trade_company_id
      t.integer :currency_id
      t.string :credit_type
      t.integer :updated_by
      t.decimal :amount, :precision => 10, :scale => 2, :default => 0
      t.integer :status_id, :default => 1
      
#      t.integer :account_id          this is for temporary, I think...

      t.timestamps
    end
    add_index :credit_notes, :trade_company_id
    add_index :credit_notes, :currency_id
  end
end
