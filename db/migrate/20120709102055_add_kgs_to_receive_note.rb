class AddKgsToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :kgs, :float, :default => 0.000
  end
end
