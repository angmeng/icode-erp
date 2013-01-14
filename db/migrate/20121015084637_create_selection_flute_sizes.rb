class CreateSelectionFluteSizes < ActiveRecord::Migration
  def change
    create_table :selection_flute_sizes do |t|
      t.float :flute_width
      t.float :flute_length
      t.integer :quotation_request_form_id

      t.timestamps
    end
  end
end
