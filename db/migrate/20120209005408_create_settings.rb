class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :backup_path
      t.string :version, :limit => 45

      t.timestamps
    end
  end
end
