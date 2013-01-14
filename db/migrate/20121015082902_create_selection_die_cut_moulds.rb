class CreateSelectionDieCutMoulds < ActiveRecord::Migration
  def change
    create_table :selection_die_cut_moulds do |t|
      t.string :mould_no
      t.string :window_no
      t.integer :quotation_request_form_id

      t.timestamps
    end
    add_index :selection_die_cut_moulds, :quotation_request_form_id
  end
end
