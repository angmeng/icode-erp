class CreateReceiptStatementLines < ActiveRecord::Migration
  def change
    create_table :receipt_statement_lines do |t|
      t.integer :receipt_id
      t.integer :statement_of_account_id
      t.timestamps
    end
    add_index :receipt_statement_lines, :receipt_id
    add_index :receipt_statement_lines, :statement_of_account_id
  end
end
