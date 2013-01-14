class RenameMfgWarehosueLicenceNoToTradeCompany < ActiveRecord::Migration
  def up
    rename_column :trade_companies, :mfg_warehosue_licence_no, :mfg_warehouse_licence_no
  end

  def down
    rename_column :trade_companies, :mfg_warehouse_licence_no, :mfg_warehosue_licence_no
  end
end
