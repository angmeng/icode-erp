class AddJobTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :report_to, :integer
  end
end
