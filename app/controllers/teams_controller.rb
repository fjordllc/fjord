class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      Affiliation.create!(
        user: current_user,
        team: @team,
        ownership: true
      )

      redirect_to root_url, notice: 'チームを作成しました。'
    else
      render :new
    end
  end

  private
    def team_params
      params.require(:team).permit(:domain)
    end
end
