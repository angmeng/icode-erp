class CreatePriceControls < ActiveRecord::Migration
  def change
    create_table :price_controls do |t|
      t.integer :pp_no
      t.date :pp_date
      t.integer :trade_company_id
      t.string :reference
      t.integer :currency_id
      t.integer :user_id
      t.string :status, :default => "Active"

      t.timestamps
    end
    
    add_index :price_controls, :trade_company_id
    add_index :price_controls, :currency_id
    add_index :price_controls, :user_id
  end
end
