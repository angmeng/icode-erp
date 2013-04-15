class AddSalesOrderItemToNewField < ActiveRecord::Migration
  def change
    add_column :new_fields, :lot_no, :string
    add_column :new_fields, :mfg_date, :date
    add_column :new_fields, :exp_date, :date
  end
end
