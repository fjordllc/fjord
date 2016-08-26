class Note < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :body, presence: true
  alias_attribute :time, :created_at

  def to_activity
    Activity.new(
      time:         created_at,
      description:  body,
      source_model: self,
      project:      project,
      user:         user,
      sort_key:     created_at.to_f
    )
  end
end
