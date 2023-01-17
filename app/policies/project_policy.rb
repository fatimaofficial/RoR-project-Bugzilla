class ProjectPolicy <  Struct.new(:user, :project)
  # def index?
  #   user.is_manager?
  # end

  def new?
    user.is_manager?
  end

  def create?
    user.is_manager?
  end

  def edit?
    user.is_manager?
  end

  def update?
    user.is_manager?
  end

  def destroy?
    user.is_manager?
  end
end
