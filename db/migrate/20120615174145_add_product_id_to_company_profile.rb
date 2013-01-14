class AddProductIdToCompanyProfile < ActiveRecord::Migration
  def change
    add_column :company_profiles, :sn_product_id_no, :integer
  end
end
