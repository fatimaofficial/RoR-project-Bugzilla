class Bug < ApplicationRecord
  belongs_to :qa
  belongs_to :project
  #has_one_attached :image
  #enums
  enum status: [:new_bug, :started, :resolved]
  enum bug_type: [:bug, :feature]
  
  #relation with developer
  has_many :bug_assignments , dependent: :destroy
  has_many :developers, through: :bug_assignments,class_name:'User'

  #validations
  validates :title, presence: true, uniqueness: true
  validates :status, presence: true
end
       