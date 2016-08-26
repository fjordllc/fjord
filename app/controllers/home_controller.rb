class HomeController < ApplicationController
  def index
    if user_signed_in?
      today = Date.current
      @day = params[:day] ? Date.parse(params[:day]) : Date.current

      @timelines = timelines(today)
      @notes = notes(today)
      @activities = (@notes + @timelines).sort {|a, b| a.sort_key <=> b.sort_key }
      @teams = current_user.teams

      stub_time = Time.new(2000, 1, 1, 0, 0, 0)
      @start_time = @timelines&.first&.time || stub_time
      @finish_time = @timelines&.last&.time || stub_time

      render 'index'
    else
      render 'guest'
    end
  end

  private
    def notes(date)
      relation = current_user.notes.order(:id)
      if date
        relation = relation.where(created_at: date...date.next_day)
      end
      relation.map(&:to_activity)
    end

    def timelines(date)
      relation = current_user.transactions.order(:id)
      if date
        relation = relation.where(created_at: date...date.next_day)
      end
      relation.inject([]) do |result, transaction|
        result + [transaction.to_activity(:start), transaction.to_activity(:finish)]
      end
    end
end
