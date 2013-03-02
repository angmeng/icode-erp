class AddTotalAmountToCompanyProfile < ActiveRecord::Migration
  def change
    add_column :company_profiles, :total_amount, :decimal, :precision => 10, :scale => 2, :default => 0
  end
end
