class RemoveIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :employment_type_id, :integer
  end
end
