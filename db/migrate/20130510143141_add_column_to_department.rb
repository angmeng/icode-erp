class AddColumnToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :shotcut_name, :string
    
    # 13/5/2013
    rename_column :statement_of_accounts, :payment_received_id, :receipt_id
    add_column :statement_of_accounts, :parent_id, :integer
  end
end
