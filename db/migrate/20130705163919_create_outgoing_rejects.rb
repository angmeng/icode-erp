class CreateOutgoingRejects < ActiveRecord::Migration
  def change
    create_table :outgoing_rejects do |t|
      t.integer :outgoing_reject_no
      t.date :outgoing_date, :default => Date.today
      t.integer :trade_company_id
      t.decimal :sales_tax, :precision => 10, :scale => 2, :default => 0.00
      t.integer :currency_id
      t.integer :trade_term_id
      t.integer :return_note_no
      t.integer :updated_by
      t.integer :delivery_order_id
      t.timestamps
    end
    add_index :outgoing_rejects, :trade_company_id
    add_index :outgoing_rejects, :currency_id
    add_index :outgoing_rejects, :trade_term_id
    add_index :outgoing_rejects, :delivery_order_id
  end
end