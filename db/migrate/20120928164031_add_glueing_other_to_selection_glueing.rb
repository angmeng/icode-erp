class AddGlueingOtherToSelectionGlueing < ActiveRecord::Migration
  def change
    add_column :selection_glueings, :glueing_other, :string
  end
end
