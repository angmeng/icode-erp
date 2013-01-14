class CreateCostingSheetChangelogs < ActiveRecord::Migration
  def change
    create_table :costing_sheet_changelogs do |t|
      t.integer :costing_sheet_id
      t.string :change_log

      t.timestamps
    end
    add_index :costing_sheet_changelogs, :costing_sheet_id
  end
end
