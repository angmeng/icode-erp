class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :code
      t.string :desc
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
