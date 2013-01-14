class RenameColumnToCompanyProfile < ActiveRecord::Migration
  def change
    rename_column :company_profiles, :sp_scrap_sheet_no, :sn_scrap_sheet_no
    rename_column :company_profiles, :sp_receiving_instr_no, :sn_receiving_instr_no
  end
end
