class Reports::MonthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target_date, only: :index

  def index
    @first_date  = @target_date.beginning_of_week
    @last_date   = @target_date.end_of_month.end_of_week

    @transactions = {}
    current_user.transactions.where(started_at: @first_date..@last_date).each do |tran|
      index = tran.started_at.strftime("%m%d")
      @transactions[index] ||= []
      @transactions[index] << tran
    end
  end

  def show
    @timelines = timelines(current_user, today)
    @notes     = notes(current_user, today)

    stub_time = Time.new(2000, 1, 1, 0, 0, 0)
    @start_time = @timelines&.first&.time || stub_time
    @finish_time = @timelines&.last&.time || stub_time
  end

  private
    def set_target_date
      if params[:month]
        y, m = params[:month].split("-").map(&:to_i)
      else
        y = today.year
        m = today.month
      end

      @target_date = Date.new(y, m, 1)
    end
end
