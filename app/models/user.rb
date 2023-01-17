class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable 
   
  def is_manager?
     type == 'Manager'
  end
  
  def is_qa?
    type == 'Qa'
  end

  def is_developer?
    type == 'Developer'
  end
end