class Subdomain::BaseController < ApplicationController
  before_action :authenticate_team_user!
  before_action :set_team
  layout 'subdomain'
  helper_method :our_team, :current_transaction, :current_project

  private

  def authenticate_team_user!
    authenticate_user! unless user_signed_in?
    unless current_user.teams.include?(team_by_subdomain)
      redirect_to root_url(subdomain: false), notice: 'このチームにアクセスできません'
    end
  end

  def current_transaction
    current_user.transactions.by_team(@team).active.order(id: :desc).limit(1).try(:first)
  end

  def current_project
    current_transaction.try(:project)
  end

  def set_team
    @team = team_by_subdomain
  end

  def our_team
    @team
  end

  def team_by_subdomain
    Team.find_by(domain: request.subdomain)
  end
end
