class AddEmailToTradeCompany < ActiveRecord::Migration
  def change
    add_column :trade_companies, :email, :string
  end
end
