class CreateIncomingRejects < ActiveRecord::Migration
  def change
    create_table :incoming_rejects do |t|
      t.integer :incoming_reject_no
      t.string :bk_one
      t.integer :purpose
      t.string :vendor_delivery_no
      t.integer :updated_by
      t.integer :purchase_requisition_item_id
      t.integer :returned_qty, :default => 0
      t.integer :order_qty, :default => 0
      t.string :job_order_no
      t.integer :balance_qty, :default => 0
      t.integer :current_stock, :default => 0
      t.string :client_part_no

      t.timestamps
    end
    add_index :incoming_rejects, :purchase_requisition_item_id
  end
end
