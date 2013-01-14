class RenameColumnToInventoryHistory < ActiveRecord::Migration
  def change
    rename_column :inventory_histories, :issue_id, :inventory_issue_id
  end
end
