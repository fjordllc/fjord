class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @timelines = timelines(current_user, today)
    @notes     = notes(current_user, today)

    stub_time = Time.new(2000, 1, 1, 0, 0, 0)
    @start_time = @timelines&.first&.time || stub_time
    @finish_time = @timelines&.last&.time || stub_time
  end
end
