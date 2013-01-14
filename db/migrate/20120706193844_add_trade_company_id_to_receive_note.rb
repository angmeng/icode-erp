class AddTradeCompanyIdToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :trade_company_id, :integer
    add_index :receive_notes, :trade_company_id
  end
end
