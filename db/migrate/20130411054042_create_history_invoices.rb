class CreateHistoryInvoices < ActiveRecord::Migration
  def change
    create_table :history_invoices do |t|
      t.integer :delivery_order_id

      t.timestamps
    end
  end
end
