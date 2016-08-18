class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    today = Date.current
    @timelines = Transaction.to_sorted_timelines(current_user, today)
    @notes = current_user.notes.where(created_at: today..today.next_day).order(:id)
    stub_time = Time.new(2000, 1, 1, 0, 0, 0)
    @start_time = @timelines&.first&.time || stub_time
    @finish_time = @timelines&.last&.time || stub_time
  end
end
