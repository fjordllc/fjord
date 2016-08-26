class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    today = Date.current

    @timelines = []
    current_user.transactions.where(created_at: today...today.next_day).each do |transaction|
      @timelines << transaction.to_activity(:start)
      @timelines << transaction.to_activity(:finish)
    end
    @timelines.sort! {|a, b| a.sort_key <=> b.sort_key }

    @notes = current_user.notes.where(created_at: today...today.next_day).order(:id)

    stub_time = Time.new(2000, 1, 1, 0, 0, 0)
    @start_time = @timelines&.first&.time || stub_time
    @finish_time = @timelines&.last&.time || stub_time
  end
end
