class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_team_user!
  before_action :set_user, only: :show
  before_action :set_day, only: :show

  def show
    set_activities(@user, @date)
  end

  private
    def set_user
      @user = fetch_user
    end

    def fetch_user
      User.find(params[:id])
    end
end
