class Subdomain::UsersController < Subdomain::BaseController
  before_action :set_user, only: :show

  def index
  end

  def show
  end

  private
    def set_user
      @user = @team.users.find_by(id: params[:id])
    end
end
