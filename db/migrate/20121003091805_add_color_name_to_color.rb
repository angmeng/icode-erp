class AddColorNameToColor < ActiveRecord::Migration
  def change
    add_column :colors, :color_name, :string
    add_index  :colors, :quotation_request_form_id
  end
end
