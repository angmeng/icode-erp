class CreatePaymentReceiveds < ActiveRecord::Migration
  def change
    create_table :payment_receiveds do |t|
      t.integer :trade_company_id
      t.date :payment_date
      t.string :bank
      t.string :place
      t.string :cheque_no
      t.date :cheque_date
      t.decimal :cheque_amount, :precision => 10, :scale => 2, :default => 0
      t.boolean :outport_cheque, :default => false
      t.boolean :third_party_cheque, :default => false
      t.integer :status_id, :default => 1
      t.integer :updated_by
      t.timestamps
    end
    add_index :payment_receiveds, :trade_company_id
  end
end
