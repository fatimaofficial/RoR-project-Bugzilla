class ProjectAssignmentsController < ApplicationController
  before_action :get_project 
  before_action :set_project_assignment, only: [:show, :edit, :update, :destroy]
  def index
    @project_assignments =@project.project_assignments
  end

  def show
  end

  def new
    
    @project_assignment=@project.project_assignments.build
   #authorize @bug
  end

  def create
    @project_assignment=@project.project_assignments.build(project_assignment_params.merge(developer_id: current_user.id))
    #authorize @bug

    if @project_assignment.save
      redirect_to project_project_assignments_path(@project), :notice => "Project assign successfully"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
  end 
 
  def assign_bug
 
    @bug_assignment=@bug.bug_assignments.create(developer_id: current_user.id)

    if @bug_assignment.save
      redirect_to root_path, :notice => "Bug picked successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_bug
    @bug = @project.bugs.find(params[:id])
  end
  def get_project
    @project = Project.find(params[:project_id])
  end
  def bug_params
    params.require(:bug).permit(:title, :bug_type, :status, :deadline, :project_id)
  end
end
