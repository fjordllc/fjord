class TimelinesController < ApplicationController
  def index
    @timelines = []
    current_user.transactions.each do |transaction|
      @timelines << transaction.to_activity(:start)
      @timelines << transaction.to_activity(:finish)
    end
    @timelines.sort! {|a, b| a.sort_key <=> b.sort_key }
  end
end
