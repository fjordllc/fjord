class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_transaction, :current_project

  def check_my_team!
    if user_sign_in? && current_user.my_team?
      redirect new_team_url(subdomain: false)
    end
  end

  def current_transaction
    current_user.transactions.active.order(id: :desc).limit(1).try(:first)
  end

  def current_project
    current_transaction.try(:project)
  end
end
