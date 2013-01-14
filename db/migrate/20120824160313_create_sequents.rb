class CreateSequents < ActiveRecord::Migration
  def change
    create_table :sequents do |t|
      t.string :sequent_color
      t.integer :quotation_request_form_id

      t.timestamps
    end
    add_index :sequents, :quotation_request_form_id
  end
end
