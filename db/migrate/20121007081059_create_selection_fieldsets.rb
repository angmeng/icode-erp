class CreateSelectionFieldsets < ActiveRecord::Migration
  def change
    create_table :selection_fieldsets do |t|
      t.integer :quotation_request_form_id
      t.integer :select_no

      t.timestamps
    end
    add_index :selection_fieldsets, :quotation_request_form_id
  end
end
