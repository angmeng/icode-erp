class AddAfterCurrentStockToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :after_current_stock, :integer
    add_column :receive_notes, :before_current_stock, :integer
    remove_column :receive_notes, :current_stock
  end
end
