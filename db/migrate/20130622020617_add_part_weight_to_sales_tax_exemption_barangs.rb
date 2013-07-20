class AddPartWeightToSalesTaxExemptionBarangs < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemption_barangs, :need_part_weight, :boolean, :default => false
    add_column :sales_tax_exemption_barangs, :convert_apply_qty, :float, :default => 0, :after => :apply_qty
    change_column :formulations, :per_value, :float, :default => 0
    change_column :formulations, :convert_value, :float, :default => 0
    
    add_column :company_profiles, :check_expire_date, :date, :default => Date.today
    add_column :delivery_orders, :authorize_print, :boolean, :default => false
  end
end