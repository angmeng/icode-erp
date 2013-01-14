class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, :default => User::ACTIVE
  end
end
