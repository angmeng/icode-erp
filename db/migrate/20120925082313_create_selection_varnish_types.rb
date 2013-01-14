class CreateSelectionVarnishTypes < ActiveRecord::Migration
  def change
    create_table :selection_varnish_types do |t|
      t.integer :quotation_request_form_id
      t.string :varnish_type

      t.timestamps
    end
    add_index :selection_varnish_types, :quotation_request_form_id
  end
end