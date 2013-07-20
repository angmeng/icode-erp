class AddStatusToStatementOfAccounts < ActiveRecord::Migration
  def change
    add_column :statement_of_accounts, :status, :integer, :default => 1
  end
end
