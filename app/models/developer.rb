class Developer < User
  has_many :project_assignments
  has_many :projects, through: :project_assignments

  has_many :bug_assignments
  has_many :bugs, through: :bug_assignments
end
 