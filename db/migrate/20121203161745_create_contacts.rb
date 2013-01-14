class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :trade_company_id
      t.string :department
      t.string :name
      t.string :phone_area_code
      t.string :phone_no
      t.string :mobile_area_code
      t.string :mobile_no
      t.string :email
      t.timestamps
    end
    add_index :contacts, :trade_company_id
  end
end
