class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_my_team!
    if user_sign_in? && current_user.my_team?
      redirect new_team_url(subdomain: false)
    end
  end
end
