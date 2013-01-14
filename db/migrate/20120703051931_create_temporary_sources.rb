class CreateTemporarySources < ActiveRecord::Migration
  def change
    create_table :temporary_sources do |t|
      t.string :company_name
      t.boolean :select_vendor, :default => false
      t.decimal :unit_price, :precision=> 8, :scale => 4, :default => 0.0000
      t.string :remark

      t.timestamps
    end
  end
end
