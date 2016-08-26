class Transaction < ApplicationRecord
  FUTURE = Time.new(2100, 1, 1, 0, 0, 0)
  belongs_to :user
  belongs_to :project
  scope :active, -> { where(finished_at: nil).order(id: :desc) }
  scope :inactive, -> { where.not(finished_at: nil).order(id: :desc) }
  scope :by_team, ->(team) { where(project_id: team.project_ids.to_a) }
  scope :by_date, ->(date = nil) { where(created_at: date..date.next_day) if date }

  def sort_key(status = :start) # :start or :finish
    datetime = status == :start ? started_at : finished_at
    (datetime || FUTURE).to_f + sprintf('0.%06d', id).to_f
  end

  def datetime(status = :start) # :start or :finish
    status == :start ? started_at : finished_at
  end

  def to_activity(status = :start) # :start or :finish
    Activity.new(
      status: status,
      time: datetime(status),
      description: I18n.t('start_xxxx', target: project.title, verb: I18n.t(status)),
      source_model: self,
      project: project,
      user: user,
      sort_key: sort_key(status)
    )
  end
end
