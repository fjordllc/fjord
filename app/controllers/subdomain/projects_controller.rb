class Subdomain::ProjectsController < Subdomain::BaseController
  before_action :set_our_project, only: %i(show edit update destroy)
  before_action :set_our_projects, only: %i(index)

  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.team = our_team

    if @project.save
      redirect_to our_projects_url, notice: 'プロジェクトを作成しました。'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to our_projects_url, notice: 'プロジェクトを変更しました。'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to our_projects_url, notice: 'プロジェクトを削除しました。'
  end

  private
    def set_our_project
      @project = our_team.projects.find(params[:id])
    end

    def set_our_projects
      @projects = our_team.projects
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
