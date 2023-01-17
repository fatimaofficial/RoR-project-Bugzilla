require 'pry'
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :destroy, :project_details, :assign_project]
  
  def index
    if (current_user.type == 'Developer')
      @projects = current_user.projects      
    else
      @projects = Project.all
   end
    
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    
    @project = Project.new(project_params.merge(manager_id: current_user.id))
    authorize @project
    if @project.save
      redirect_to @project, :notice => "Project created successfully"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(project_params)
      redirect_to project_details_project_path, :notice => "Project updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @project
    @project = Project.find(params[:id])
    @project.destroy!
    redirect_to root_path, :notice => "Project has been deleted"
  end
  #assign project to developer
  def assign_project
    @dev_id= params[:uid] 
    if (ProjectAssignment.where(:developer_id=>@dev_id ,:project_id=>@project.id)==[])
        @project_assign=@project.project_assignments.create(developer_id: @dev_id)
        if @project_assign.save
          redirect_to  project_details_project_path, :notice => "Project assign successfully"
        else
          render :new, status: :unprocessable_entity
        end
    else
       redirect_to  project_details_project_path, :notice => "This Project has already been assigned"  
    end

  end

  def project_details
    @users=User.where(type: "Developer")
  end
 
  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description,:project_id)
  end
 

end
