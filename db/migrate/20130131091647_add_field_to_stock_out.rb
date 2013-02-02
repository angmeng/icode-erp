class AddFieldToStockOut < ActiveRecord::Migration
  def change
  	add_column    :stock_outs, :unit_measurement_id, :integer
  	add_column    :stock_outs, :collector_name , :string
  	add_column    :stock_outs, :issued_by, :integer
  	add_column    :stock_outs, :location, :string
  	add_column    :stock_outs, :reference_no, :string
  	rename_column :stock_outs , :amount , :quantity
    add_index     :stock_outs, :unit_measurement_id
  end
end
