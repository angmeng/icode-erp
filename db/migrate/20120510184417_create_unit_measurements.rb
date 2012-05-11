class CreateUnitMeasurements < ActiveRecord::Migration
  def change
    create_table :unit_measurements do |t|
      t.string :code
      t.string :desc

      t.timestamps
    end
  end
end
