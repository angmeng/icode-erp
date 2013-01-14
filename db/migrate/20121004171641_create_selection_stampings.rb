class CreateSelectionStampings < ActiveRecord::Migration
  def change
    create_table :selection_stampings do |t|
      t.string :stamping_type
      t.string :stamping_other
      t.string :quotation_request_form_id
      t.timestamps
    end
  end
end
