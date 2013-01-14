class ChangeUserTypeToTradeCompany < ActiveRecord::Migration
  def change
    change_column :trade_companies, :user_type, :string
  end
end
