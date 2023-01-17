class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.integer :bug_type, default: 0
      t.integer :status, default: 0
      t.datetime :deadline
      t.belongs_to :qa
      t.timestamps
    end
  end
end






