require 'pry'
class BugsController < ApplicationController
  before_action :get_project 
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :assign_bug]
  def index
    @bugs=@project.bugs.all
  
  end

  def show
    @bug=@project.bugs.find(params[:id])
  end

  def new   
    @bug=@project.bugs.build 
    authorize @bug
  end

  def create
    @bug=@project.bugs.build(bug_params.merge(qa_id: current_user.id))
    authorize @bug

    if @bug.save
      redirect_to project_bugs_path(@project), :notice => "Bug created successfully"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    # @bug=@project.bugs.find(params[:id])
    authorize @bug
  end

  def update
    authorize @bug
    if @bug.update(bug_params)
      redirect_to project_bugs_path(@project), notice:"Bug is updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
   
  end

  def destroy
    authorize @bug
    @bug = @project.bugs.find(params[:id])
    @bug.destroy!
    redirect_to project_bugs_path(@project), :notice => "Bug has been deleted"
  end 
 
  def assign_bug
   
    if(current_user.type == 'Developer')
      if (BugAssignment.where(:developer_id=>current_user.id ,:bug_id=>@bug.id)==[])
        @bug_assignment=@bug.bug_assignments.create(developer_id: current_user.id)

        if @bug_assignment.save
          redirect_to project_bugs_path, :notice => "Bug picked successfully"
        else
          render :new, status: :unprocessable_entity
        end
      else 
        redirect_to project_bugs_path, :notice => "You have already picked a bug."
      end
      
    else
      redirect_to  project_bugs_path,:notice => "Only developers can pick bugs"
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
    @bug=@project.bugs.build 
    params.require(:bug).permit(policy(@bug).permitted_attributes, :project_id)
  end

end
