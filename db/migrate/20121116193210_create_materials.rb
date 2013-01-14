class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :code
      t.string :description
      t.string :status, :default => "Active"

      t.timestamps
    end
  end
end
