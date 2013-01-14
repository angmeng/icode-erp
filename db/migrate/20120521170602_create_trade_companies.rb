class CreateTradeCompanies < ActiveRecord::Migration
  def change
    create_table :trade_companies do |t|
      t.string :code
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :tel_no_1
      t.string :tel_no_2
      t.string :fax_no
      t.string :contact_person
      t.string :type_of_sales
      t.string :sales_tax_no
      t.integer :sales_tax_exemption, :default => 0
      t.string :sales_rep
      t.integer :trade_term
      t.boolean :status

      t.timestamps
    end
  end
end
