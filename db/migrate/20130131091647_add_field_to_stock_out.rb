class AddFieldToStockOut < ActiveRecord::Migration
  def change
  	add_column :stock_outs, :unit_measurement_id, :integer

  	add_column :stock_outs, :collector_name , :string

  	add_column :stock_outs, :issued_by, :string

  	add_column :stock_outs, :location , :string

  	add_column :stock_outs, :reference_no , :string

  	rename_column :stock_outs , :amount , :quantity
  end

 
  
end
