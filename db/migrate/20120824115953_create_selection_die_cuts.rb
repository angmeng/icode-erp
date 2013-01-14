class CreateSelectionDieCuts < ActiveRecord::Migration
  def change
    create_table :selection_die_cuts do |t|
      t.integer :quotation_request_form_id
      t.string :content

      t.timestamps
    end
    add_index :selection_die_cuts, :quotation_request_form_id
  end
end
