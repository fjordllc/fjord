class Subdomain::HomeController < Subdomain::BaseController
  before_action :authenticate_team_user!

  def index
  end
end
