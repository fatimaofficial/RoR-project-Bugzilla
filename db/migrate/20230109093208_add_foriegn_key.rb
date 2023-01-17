class AddForiegnKey < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :project_id, :integer
    add_foreign_key :bugs, :projects
  end
end
