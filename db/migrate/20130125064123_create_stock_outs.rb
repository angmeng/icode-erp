class CreateStockOuts < ActiveRecord::Migration
  def change
    create_table :stock_outs do |t|
      t.string :transfer_note
      t.integer :product_id 
      t.decimal :amount , :default => 0.00, :precision => 10 , :scale => 2
      t.decimal :balance , :precision => 10 , :scale => 2

      t.timestamps
    end
  end
end
