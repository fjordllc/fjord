class Transaction < ApplicationRecord
  FUTURE = Time.new(2100, 1, 1, 0, 0, 0)
  belongs_to :user
  belongs_to :project
  scope :active, -> { where(finished_at: nil).order(id: :desc) }
  scope :inactive, -> { where.not(finished_at: nil).order(id: :desc) }
  scope :by_team, ->(team) { where(project_id: team.project_ids.to_a) }
  scope :by_date, ->(date = nil) { where(created_at: date..date.next_day) if date }

  def self.to_sorted_timelines(user, date = nil)
    transactions = self.where(user: user).by_date(date)

    timelines = {}
    transactions.each do |transaction|
      timelines[transaction.sort_index(:start)]  = transaction.to_timeline(:start)
      timelines[transaction.sort_index(:finish)] = transaction.to_timeline(:finish)
    end

    timelines.sort.map do |timeline|
      timeline[1]
    end
  end

  def sort_index(status = :start)
    datetime = status == :start ? started_at : finished_at
    (datetime || FUTURE).to_f + id
  end

  def datetime(status = :start)
    status == :start ? started_at : finished_at
  end

  def to_timeline(status = :start)
    Timeline.new(
      status:      status,
      time:        datetime(status),
      transaction: self,
      project:     project,
      user:        user
    )
  end
end
