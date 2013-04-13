class CreateJournalVoucherItems < ActiveRecord::Migration
  def change
    create_table :journal_voucher_items do |t|
      t.string :document_type
      t.integer :document_no
      t.date :document_date
      t.decimal :document_amount, :precision => 10, :scale => 4, :default => 0.0000
      t.decimal :balance_amount, :precision => 10, :scale => 4, :default => 0.0000
      t.integer :fp
      t.decimal :os_amount, :precision => 10, :scale => 4, :default => 0.0000
      t.integer :journal_voucher_id
      t.timestamps
    end
    add_index :journal_voucher_items, :journal_voucher_id
  end
end
