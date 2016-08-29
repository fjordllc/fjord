class Project < ApplicationRecord
  belongs_to :team
  belongs_to :company
  has_many :transactions
  validates :title, presence: true,
                    uniqueness: { scope: :team_id },
                    length: { maximum: 100 }
end
