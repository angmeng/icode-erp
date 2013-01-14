class CreateCostingSheetFormulations < ActiveRecord::Migration
  def change
    create_table :costing_sheet_formulations do |t|
      t.string :code
      t.string :name
      t.string :formulation
      t.string :status, :default => "A"

      t.timestamps
    end
  end
end
