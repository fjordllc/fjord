class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :project
  scope :active, -> { where(finished_at: nil).order(id: :desc) }
  scope :inactive, -> { where.not(finished_at: nil).order(id: :desc) }
  scope :by_team, ->(team) { where(project_id: team.project_ids.to_a) }

  def self.to_sorted_timelines(user, date = nil)
    transactions =
      if date
        self.where(user: user, created_at: date..date.next_day)
      else
        self.where(user: user)
      end

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

    timelines.sort.map do |timeline|
      timeline[1]
    end
  end
end
