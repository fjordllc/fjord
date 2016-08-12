class TimelinesController < ApplicationController
  def index
    transactions = Transaction.where(user: current_user)

    timelines = {}
    transactions.each do |transaction|
      start  = (transaction.started_at.try(:to_f)  || Time.new(2100, 1, 1).to_f) + transaction.id.to_f
      finish = (transaction.finished_at.try(:to_f) || Time.new(2100, 1, 1).to_f) + transaction.id.to_f 
      timelines[start]  = { status: '開始', data: transaction }
      timelines[finish] = { status: '終了', data: transaction }
    end

    @timelines = timelines.sort
  end
end
