class ReportsController < ApplicationController
  def index
    set_activities(current_user, Date.current)

    stub_time    = Time.new(2000, 1, 1, 0, 0, 0)
    @start_time  = @timelines&.first&.time || stub_time
    @finish_time = @timelines&.last&.time || stub_time
  end
end
