class CreateTemporaryTarifCodes < ActiveRecord::Migration
  def change
    create_table :temporary_tarif_codes do |t|
      t.string :tarif_code
      t.float :remaining_total

#      t.timestamps
    end
  end
end
