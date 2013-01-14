class CreateSalesTaxExemptionItems < ActiveRecord::Migration
  def change
    create_table :sales_tax_exemption_items do |t|
      t.integer :sales_tax_exemption_id
      t.integer :product_id
      t.float :remaining_total

      t.timestamps
    end
  end
end
