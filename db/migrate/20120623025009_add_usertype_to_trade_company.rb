class AddUsertypeToTradeCompany < ActiveRecord::Migration
  def change
    add_column :trade_companies, :user_type, :integer
  end
end
