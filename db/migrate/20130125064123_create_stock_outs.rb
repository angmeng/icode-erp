class CreateStockOuts < ActiveRecord::Migration
  def change
    create_table :stock_outs do |t|
<<<<<<< HEAD
      t.string :transfer_note
      t.integer :product_id 
      t.decimal :amount , :default => 0.00, :precision => 10 , :scale => 2
      t.decimal :balance , :precision => 10 , :scale => 2

      t.timestamps
    end
=======
      t.string  :transfer_note_no
      t.integer :product_id 
      t.decimal :amount ,  :precision => 10 , :scale => 2, :default => 0.00
      t.decimal :balance , :precision => 10 , :scale => 2, :default => 0.00
      t.timestamps
    end
    add_index :stock_outs, :product_id 
>>>>>>> 4127eef4ca7305cceee9cbb695e58987c99b7269
  end
end
