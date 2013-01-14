class CreateChangeCompanyCodes < ActiveRecord::Migration
  def change
    create_table :change_company_codes do |t|
      t.string :old_code
      t.string :new_code
      t.integer :trade_company_id
      t.string :remark

      t.timestamps
    end
    
    add_index :change_company_codes, :trade_company_id
  end
end
