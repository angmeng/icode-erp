class AddCopiedNoToProduct < ActiveRecord::Migration
  def change
    add_column    :products, :copied_no, :integer, :default => 0
    remove_column :product_running_numbers, :copied_no
  end
end
