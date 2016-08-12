class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :project
  scope :active, -> { where(finished_at: nil).order(id: :desc) }
  scope :inactive, -> { where.not(finished_at: nil).order(id: :desc) }
  scope :by_team, ->(team) { where(project_id: team.project_ids.to_a) }
end
