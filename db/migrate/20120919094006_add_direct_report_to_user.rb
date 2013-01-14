class AddDirectReportToUser < ActiveRecord::Migration
  def change
    add_column :users, :direct_report, :boolean, :default => FALSE
  end
end
