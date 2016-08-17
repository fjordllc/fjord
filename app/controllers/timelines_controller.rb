class TimelinesController < ApplicationController
  def index
    transactions = Transaction.where(user: current_user)

    timelines = {}
    transactions.each do |transaction|
      start  = (transaction.started_at.try(:to_f)  || Time.new(2100, 1, 1).to_f) + transaction.id.to_f
      finish = (transaction.finished_at.try(:to_f) || Time.new(2100, 1, 1).to_f) + transaction.id.to_f

      timelines[start] = Timeline.new(
        status: '開始',
        time: transaction.created_at,
        transaction: transaction,
        project: transaction.project,
        user: transaction.user
      )
      timelines[finish] = Timeline.new(
        status: '終了',
        time: transaction.created_at,
        transaction: transaction,
        project: transaction.project,
        user: transaction.user
      )
    end

    @timelines = timelines.sort.map do |timeline|
      timeline[1]
    end
  end
end
