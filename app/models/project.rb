class Project < ApplicationRecord
  belongs_to :team
  validates :title, presence: true, length: { maximum: 64 }
end
