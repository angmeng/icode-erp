class AddRnDateToReceiveNote < ActiveRecord::Migration
  def change
    add_column :receive_notes, :rn_date, :date
  end
end
