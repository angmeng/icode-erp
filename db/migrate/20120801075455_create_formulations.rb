class CreateFormulations < ActiveRecord::Migration
  def change
    create_table :formulations do |t|
      t.decimal :per_value, :precision => 8, :scale => 2
      t.integer :from_unit_measurement_id
      t.decimal :convert_value, :precision => 8, :scale => 2
      t.integer :to_unit_measurement_id

      t.timestamps
    end
  end
end
