class HomeController < ApplicationController
  before_action :set_day, only: :index

  def index
    if user_signed_in?
      set_activities(current_user, @day)
      @teams = current_user.teams

      stub_time    = Time.new(2000, 1, 1, 0, 0, 0)
      @start_time  = @timelines&.first&.time || stub_time
      @finish_time = @timelines&.last&.time || stub_time

      render 'index'
    else
      render 'guest'
    end
  end
end
