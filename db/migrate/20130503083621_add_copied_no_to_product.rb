class AddCopiedNoToProduct < ActiveRecord::Migration
  def change
    add_column    :products, :copied_no, :integer, :default => 0
    remove_column :product_running_numbers, :copied_no
    add_column :credit_notes, :remark, :text
    add_column :debit_notes, :remark, :text
    add_column :receipts, :payment_received_id, :integer
    add_index :receipts, :payment_received_id
  end
  
end
