class CreateTradeTerms < ActiveRecord::Migration
  def change
    create_table :trade_terms do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
