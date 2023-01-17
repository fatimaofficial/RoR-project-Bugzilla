class ProjectAssignment < ApplicationRecord
  belongs_to :project
  belongs_to :developer,class_name:'User'
end
