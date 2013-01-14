class CreateInventoryIssues < ActiveRecord::Migration
  def change
    create_table :inventory_issues do |t|
      t.string :description
      t.string :in_out

      t.timestamps
    end
  end
end
