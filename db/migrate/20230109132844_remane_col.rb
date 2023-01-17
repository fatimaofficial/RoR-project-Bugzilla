class RemaneCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_assignments, :user_id, :developer_id
    rename_column :bug_assignments, :user_id, :developer_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
