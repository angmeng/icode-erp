class ChangeStatusToTradeCompany < ActiveRecord::Migration
  def change
    change_column :trade_companies, :status, :integer
  end
end
