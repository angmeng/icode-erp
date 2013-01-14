class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :color_code
      t.integer :quotation_request_form_id

      t.timestamps
    end
  end
end
