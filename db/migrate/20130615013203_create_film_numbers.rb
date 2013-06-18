class CreateFilmNumbers < ActiveRecord::Migration
  def change
    create_table :film_numbers do |t|
      t.string :color_name
      t.string :color_code
      t.string :bom_size
      t.date :film_date
      t.integer :bom_id

      t.timestamps
    end
    add_index :film_numbers, :bom_id
  end
end
