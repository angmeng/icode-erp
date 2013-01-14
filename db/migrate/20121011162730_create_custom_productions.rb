class CreateCustomProductions < ActiveRecord::Migration
  def change
    create_table :custom_productions do |t|
      t.string :lot_size
      t.string :part_no
      t.string :category_no
      t.string :stock_reference
      t.integer :quotation_request_form_id

      t.timestamps
    end
    add_index :custom_productions, :quotation_request_form_id
  end
end
