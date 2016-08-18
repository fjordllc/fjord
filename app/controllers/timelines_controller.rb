class TimelinesController < ApplicationController
  def index
    @timelines = Transaction.to_sorted_timelines(current_user)
  end
end
