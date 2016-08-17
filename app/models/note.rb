class Note < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :body, presence: true
  alias_attribute :time, :created_at
end
