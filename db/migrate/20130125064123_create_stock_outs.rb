class CreateStockOuts < ActiveRecord::Migration
  def change
    create_table :stock_outs do |t|
      t.string  :transfer_note_no
      t.integer :product_id 
      t.decimal :amount ,  :precision => 10 , :scale => 2, :default => 0.00
      t.decimal :balance , :precision => 10 , :scale => 2, :default => 0.00
      t.timestamps
    end
    add_index :stock_outs, :product_id 
  end
end
