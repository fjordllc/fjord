class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_my_team!
    if user_sign_in? && current_user.my_team?
      redirect new_team_url(subdomain: false)
    end
  end

  protected

  def configure_permitted_parameters
    keys = %i(first_name last_name)
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
