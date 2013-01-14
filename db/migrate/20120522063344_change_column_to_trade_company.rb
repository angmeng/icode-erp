class ChangeColumnToTradeCompany < ActiveRecord::Migration
  def change
    rename_column :trade_companies, :type_of_sales, :type_of_sale_id
    rename_column :trade_companies, :trade_term, :trade_term_id
    
    change_column :trade_companies, :type_of_sale_id, :integer
    change_column :trade_companies, :trade_term_id, :integer
    
    add_index :trade_companies, :type_of_sale_id
    add_index :trade_companies, :trade_term_id
  end
end
