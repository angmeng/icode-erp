class AddStatusToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :status, :string, :default => "ACTIVE"
    add_column :trade_terms, :status, :string, :default => "ACTIVE"
    add_column :transports, :status, :string, :default => "ACTIVE"
  end
end
