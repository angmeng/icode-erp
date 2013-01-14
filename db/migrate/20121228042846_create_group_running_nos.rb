class CreateGroupRunningNos < ActiveRecord::Migration
  def change
    create_table :group_running_nos do |t|
      t.string :code
      t.integer :current_no, :default => 0

      t.timestamps
    end
  end
end