class CreateJournalVouchers < ActiveRecord::Migration
  def change
    create_table :journal_vouchers do |t|
      t.integer :jv_no
      t.date :jv_date
      t.integer :trade_company_id
      t.string :particular
      t.decimal :debit_amount, :precision => 10, :scale => 4, :default => 0.0000
      t.decimal :credit_amount, :precision => 10, :scale => 4, :default => 0.0000
      t.integer :updated_by
      t.integer :status_id, :default => DataStatus::ACTIVE
      t.timestamps
    end
    add_index :journal_vouchers, :trade_company_id
  end
end
