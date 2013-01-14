class CreateSelectionGlueings < ActiveRecord::Migration
  def change
    create_table :selection_glueings do |t|
      t.integer :quotation_request_form_id
      t.string :glueing

      t.timestamps
    end
    add_index :selection_glueings, :quotation_request_form_id
  end
end
