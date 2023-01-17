class Project < ApplicationRecord

  belongs_to :manager
  
  has_many :project_assignments, dependent: :destroy
  has_many :developers, through: :project_assignments, class_name:'User'

  has_many :bugs, dependent: :destroy

  #validations
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
