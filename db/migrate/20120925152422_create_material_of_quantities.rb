class CreateMaterialOfQuantities < ActiveRecord::Migration
  def change
#    remove_column :quotation_request_forms, :unit_price
    
    create_table :material_of_quantities do |t|
      t.integer :quotation_request_form_id
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
    
    add_index :material_of_quantities, :quotation_request_form_id
  end
end
