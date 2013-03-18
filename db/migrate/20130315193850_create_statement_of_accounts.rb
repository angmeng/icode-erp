class CreateStatementOfAccounts < ActiveRecord::Migration
  def change
    create_table :statement_of_accounts do |t|
      t.integer :trade_company_id
      t.date :transaction_date
      t.string :transaction_type
      t.integer :debit_note_id
      t.integer :credit_note_id

      t.timestamps
    end
    add_index :statement_of_accounts, :trade_company_id
    add_index :statement_of_accounts, :debit_note_id
    add_index :statement_of_accounts, :credit_note_id
  end
end
