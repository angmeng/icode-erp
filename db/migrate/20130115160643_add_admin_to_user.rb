# valid rollback from 16/1/2013
# close rollback at dd/mm/yyyy

class AddAdminToUser < ActiveRecord::Migration
  def change
#    remove_column :users, :level
#    remove_column :users, :report_to
#    remove_column :users, :direct_report
#    
#    remove_column :users, :status
    add_column :users, :status, :integer, :default => DataStatus::ACTIVE
#    remove_column :departments, :status
    add_column :departments, :status, :integer, :default => DataStatus::ACTIVE
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :level_two, :integer
    add_column :users, :level_three, :integer
  end
end
