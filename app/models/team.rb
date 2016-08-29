class Team < ApplicationRecord
  has_many :affiliations
  has_many :projects
  has_many :transactions
  has_many :companies
  has_many :users, through: :affiliations
  has_one :owner_affiliation, -> { where(ownership: true) }, class_name: 'Affiliation'
  has_one :owner, through: :owner_affiliation, source: :user

  validates :domain, presence: true,
                     uniqueness: true,
                     length: { maximum: 100 },
                     format: { with: /\A[a-zA-Z0-9].[a-zA-Z0-9-]+[a-zA-Z0-9].\Z/ }
end
