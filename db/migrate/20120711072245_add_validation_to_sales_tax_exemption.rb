class AddValidationToSalesTaxExemption < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemptions, :valid_condition, :boolean, :default => false
  end
end
