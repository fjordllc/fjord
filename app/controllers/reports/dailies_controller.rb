class Reports::DailiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_day, only: :index

  def index
    set_activities(current_user, @day)
  end

  private
    def set_day
      @day = params[:day] ? Date.parse(params[:day]) : Date.current
    end
end
