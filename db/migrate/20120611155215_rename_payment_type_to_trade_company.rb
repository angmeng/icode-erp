class RenamePaymentTypeToTradeCompany < ActiveRecord::Migration
  def change
    rename_column :trade_companies, :payment_type, :payment_type_id
  end
end
