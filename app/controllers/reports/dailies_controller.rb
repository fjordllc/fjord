class Reports::DailiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_day, only: :index

  def index
    set_activities(current_user, @day)
    @transactions = current_user.transactions.where(started_at: @day..@day.tomorrow).order(:started_at)
  end

  private
    def set_day
      @day = params[:day] ? Date.parse(params[:day]) : Date.current
    end
end
