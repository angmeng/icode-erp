class CreateSelectionStampingSizes < ActiveRecord::Migration
  def change
    create_table :selection_stamping_sizes do |t|
      t.float :stamping_width, :default => 0.00
      t.float :stamping_length, :default => 0.00
      t.integer :quotation_request_form_id

      t.timestamps
    end
    add_index :selection_stamping_sizes, :quotation_request_form_id
  end
end
