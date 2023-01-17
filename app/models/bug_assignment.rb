class BugAssignment < ApplicationRecord
  belongs_to :bug
  belongs_to :developer,class_name:'User'
end
