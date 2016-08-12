class Project < ApplicationRecord
  belongs_to :team
  has_many :transactions
  validates :title, presence: true,
                    uniqueness: { scope: :team_id },
                    length: { maximum: 100 }
end
