class AddOpenBalanceToStatementOfAccounts < ActiveRecord::Migration
  def change
    add_column :statement_of_accounts, :open_balance, :boolean, :default => false
    add_column :statement_of_accounts, :running_no, :string
    add_column :statement_of_accounts, :description, :string
  end
end