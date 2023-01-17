class BugPolicy < Struct.new(:user, :bug)
  # def index?
  #   user.is_manager?
  # end
  def permitted_attributes
    if user.is_qa? 
      [:title, :bug_type, :status, :deadline]  
    else
      [:status]    
    end
  end

  def new?
    user.is_qa?
  end

  def create?
    user.is_qa?
  end

  def edit?
    user.is_qa? or user.is_developer?
  end

  def update?
     user.is_qa? or user.is_developer?
  end

  def destroy?  
    user.is_qa? 
  end
  
end
