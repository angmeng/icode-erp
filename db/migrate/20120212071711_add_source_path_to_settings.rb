class AddSourcePathToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :source_path, :string
  end
end
