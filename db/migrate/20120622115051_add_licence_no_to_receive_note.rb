class AddLicenceNoToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :licence_no, :string
    rename_column :sales_tax_exemptions, :license_no, :licence_no
  end
end
