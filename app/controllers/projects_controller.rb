class ProjectsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 5)
  end
  def show
  end
  def edit
  end
  def destroy
    @project.destroy
    redirect_to posts_path, notice: 'succesfully deleted!'
  end
  def update
    if @project.update project_params
        redirect_to @project, notice: 'succesfully updated!'
      else
        render 'edit'
    end
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, :notice => 'zgunz your project ' << @project.title << ' created !'
    else
      render 'new', notice: 'zgunz sorry, something wrong :( !!'
    end
  end
  private
  def find_project
    @project = Project.friendly.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:title, :description, :slug, :link, missions_attributes: [:id, :title, :content])
  end
end
