class HomeController < ApplicationController
  def index
    if user_signed_in?
      @my_teams = current_user.teams
      render 'index'
    else
      render 'guest'
    end
  end
end
