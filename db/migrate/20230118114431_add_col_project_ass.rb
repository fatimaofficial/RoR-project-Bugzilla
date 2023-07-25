class AddColProjectAss < ActiveRecord::Migration[7.0]
  def change
    add_column :project_assignments, :is_assign, :boolean, :default => true
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
