class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :receipt_no
      t.date :receipt_date
      t.integer :trade_company_id
      t.decimal :cash_amount, :precision => 10, :scale => 2, :default => 0
      t.decimal :cheque_amount, :precision => 10, :scale => 2, :default => 0
      t.decimal :total_amount, :precision => 10, :scale => 2, :default => 0
      t.string :journal_voucher_no
      t.string :remark
      t.integer :updated_by
      t.integer :status_id, :default => 1

      t.timestamps
    end
    add_index :receipts, :trade_company_id
  end
end
