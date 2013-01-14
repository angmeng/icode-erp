class RenameSymbolToCurrency < ActiveRecord::Migration
  def change
    rename_column :currencies, :symbol, :status
    change_column :currencies, :status, :string, :default => Currency::ACTIVE
  end
end
