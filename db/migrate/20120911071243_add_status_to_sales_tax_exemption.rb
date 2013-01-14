class AddStatusToSalesTaxExemption < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemptions, :status, :string, :default => SalesTaxExemption::ACTIVE
  end
end
