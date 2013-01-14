class ChangeColumnApplyQtyToSalesTaxExemption < ActiveRecord::Migration
  def change
    change_column :sales_tax_exemptions, :apply_qty, :float, {:default => 0, :precision => 10, :scale => 2}
    change_column :sales_tax_exemptions, :complete_qty, :float, {:default => 0, :precision => 10, :scale => 2}
  end
end
