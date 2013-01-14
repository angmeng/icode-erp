class AddLimitToTradeCompany < ActiveRecord::Migration
  def change
    rename_column :trade_companies, :current_ac_amount, :limit_amount
    add_column :trade_companies, :banking_name, :string
    add_column :trade_companies, :banking_account, :string
  end
end
