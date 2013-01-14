class CreatePrePrintTypes < ActiveRecord::Migration
  def change
    create_table :pre_print_types do |t|
      t.integer :quotation_request_form_id
      t.string :pre_print
      t.string :other
      t.timestamps
    end
    add_index :pre_print_types, :quotation_request_form_id
  end
end
