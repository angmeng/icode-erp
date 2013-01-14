class AddStatusToUnitMeasurement < ActiveRecord::Migration
  def change
    add_column :unit_measurements, :status, :string, :default => UnitMeasurement::ACTIVE
  end
end
