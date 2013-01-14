class AddColumnToIncomingReject < ActiveRecord::Migration
  def up
    add_column :incoming_rejects, :ir_date, :date
    add_column :incoming_rejects, :sales_tax_exemption_no, :string
    remove_column :incoming_rejects, :bk_one
  end
  
  def down
    remove_column :incoming_rejects, :ir_date
    remove_column :incoming_rejects, :sales_tax_exemption_no
    add_column :incoming_rejects, :bk_one, :string
  end
end
