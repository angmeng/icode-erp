class CreateSelectionPrintingSizes < ActiveRecord::Migration
  def change
    create_table :selection_printing_sizes do |t|
      t.integer :quotation_request_form_id
      t.float :length, :default => 0.00
      t.float :width, :default => 0.00
      t.integer :ups, :default => 0

      t.timestamps
    end
    add_index :selection_printing_sizes, :quotation_request_form_id
  end
end
