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

  private
    def notes(user, date = nil)
      return @_notes if @_notes

      relation = user.notes.order(:id)
      if date
        relation = relation.where(created_at: date...date.next_day)
      end
      @_notes = relation.map(&:to_activity)
    end

    def timelines(user, date = nil)
      return @_timelines if @_timelines

      relation = user.transactions.order(:id)
      if date
        relation = relation.where(started_at: date...date.next_day)
      end
      @_timelines = relation.inject([]) do |result, transaction|
        result + [transaction.to_activity(:start), transaction.to_activity(:finish)]
      end
      @_timelines.sort {|a, b| a.sort_key <=> b.sort_key }
    end

    def activities(user, date = nil)
      return @_activities if @_activities

      activities = notes(user, date) + timelines(user, date)
      @_activities = activities.sort {|a, b| a.sort_key <=> b.sort_key }
    end

    def set_activities(user, date)
      @timelines  = timelines(user, date)
      @notes      = notes(user, date)
      @activities = activities(user, date)
    end

    def authenticate_team_user!
      unless current_user.team_user?(fetch_user)
        redirect_to root_url, notice: 'チームメンバーではありません。'
      end
    end

    def today
      @_today ||= Date.current
    end

    def now
      @_now ||= Time.current
    end

    def set_day
      @day = params[:day] ? Date.parse(params[:day]) : today
    end
end
