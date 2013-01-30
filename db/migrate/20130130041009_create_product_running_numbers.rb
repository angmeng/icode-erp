class CreateProductRunningNumbers < ActiveRecord::Migration
  def change
    create_table :product_running_numbers do |t|
      t.string :base_name
      t.string :sub_name
      t.integer :running_no, :default => 0
      t.timestamps
    end
  end
end
