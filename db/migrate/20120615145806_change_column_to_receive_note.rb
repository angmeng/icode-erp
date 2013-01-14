class ChangeColumnToReceiveNote < ActiveRecord::Migration
  def change
    change_column :receive_notes, :vendor_delivery_no, :string
  end
end
