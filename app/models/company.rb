class Company < ApplicationRecord
  belongs_to :team
  has_many :projects
  validates :name, presence: true
end
