class CreateReceiptItems < ActiveRecord::Migration
  def change
    create_table :receipt_items do |t|
      t.integer :receipt_type
      t.string :document_no
      t.date :document_date
      t.decimal :document_amount, :precision => 10, :scale => 2, :default => 0
      t.decimal :balance_amount, :precision => 10, :scale => 2, :default => 0
      t.decimal :os_amount, :precision => 10, :scale => 2, :default => 0
      t.string  :fp, :default => "F"
      t.integer :receipt_id
      t.integer :status_id, :default => 1

      t.timestamps
    end
    add_index :receipt_items, :receipt_id
  end
end
