class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.integer :po_no
      t.date :po_date
      t.integer :trade_company_id
      t.integer :purchase_by
      t.integer :request_by
      t.integer :currency_id
      t.integer :trade_term_id
      t.integer :transport_id
      t.integer :revision
      t.integer :tax
      t.integer :verify
      t.integer :user_id
      t.integer :updated_by

      t.timestamps
    end
    add_index :purchase_orders, :trade_company_id
    add_index :purchase_orders, :trade_term_id
  end
end
