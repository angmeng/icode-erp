class AddColumnToTradeCompany < ActiveRecord::Migration
  def change
    add_column :trade_companies, :customer_approval, :integer, :default => 0
    add_column :trade_companies, :company_reg_no, :string
    add_column :trade_companies, :payment_type, :integer
    add_column :trade_companies, :opening_ac_date, :date
    add_column :trade_companies, :opening_ac_amount, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :trade_companies, :current_ac_amount, :decimal, :precision => 10, :scale => 2, :default => 0
  end
end
