class CreateTypeOfSales < ActiveRecord::Migration
  def change
    create_table :type_of_sales do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
